class ANTLR4Assembler:
    def __init__(self):
        self.importirovanniye_obiekty = []
        self.rezultat_listing_lexers = []
        self.rezultat_listing_parser = []

    def polychitListing(self):
        return self.rezultat_listing_parser + "\n\n\n" + "//" * 10 + "\n\n\n" + self.rezultat_listing_lexers

    def processFile(self, name: str):
        import re
        with open(name + '.g4', 'r') as f:
            data = f.read()
            print("process faila", name)
            import_faila = []
            try:
                import_faila = re.findall(r'import ([^;]+)', data)[0]
                import_faila = import_faila.split(',')
                for i, element in enumerate(import_faila):
                    import_faila[i] = element.strip()
            except Exception as e: pass
            
            # удаление правил оглавления
            data = re.sub(r'^import[^;];', '', data)
            data = re.sub(r'grammar[^;];', '', data)

        for IMPORT in import_faila:
            if IMPORT in self.importirovanniye_obiekty:
                print("propusk", IMPORT)
                continue
            else:
                self.importirovanniye_obiekty.append(IMPORT)
                self.processFile(IMPORT)


        failobjiekta_str1 = f"\n// ФАЙЛ ОБЪХЕКТА {name}"
        self.rezultat_listing_lexers.append(failobjiekta_str1)
        self.rezultat_listing_parser.append(failobjiekta_str1)
        
        for RULE in data.split(';'):
            RULE = RULE.strip()
            if len(RULE) == 0 or RULE.startswith("import") or RULE.startswith("grammar") : continue
            if RULE.startswith('//'):
                if RULE.find("\n") == -1: continue
                RULE = re.sub(r'//[^\n]+\n', '', RULE).strip()
            print('<>' + RULE + '<>') 
            if RULE[0].lower() == RULE[0] and not RULE.startswith("fragment\n") and not RULE.startswith("fragment "):
                self.rezultat_listing_parser.append(RULE + f";")
            else:
                self.rezultat_listing_lexers.append(RULE + f";")
        
            

        



obj = ANTLR4Assembler()
obj.processFile("Yap")

with open("YapComplete.g4", 'w') as f:
    f.write("grammar YapComplete;\n" + '\n'.join(obj.rezultat_listing_parser) + '\n' + '\n'.join(obj.rezultat_listing_lexers))
