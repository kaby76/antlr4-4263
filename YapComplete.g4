grammar YapComplete;

// ФАЙЛ ОБЪХЕКТА Oglavleniye
probelniy: PROBEL | TABYLACIYA | PROBELNIY;

// ФАЙЛ ОБЪХЕКТА Chisla2
aБинарноеЧисло: W_БИНАРНОЕ_ЧИСЛО;
aТритичноеЧисло: W_ТРИТИЧНОЕ_ЧИСЛО;
aЧетверичноеЧисор: W_ЧЕТВЕРИЧНОЕ_ЧИСЛО;
aПятеричноеЧисло: W_ПЯТЕРИЧНОЕ_ЧИСЛО;
aШестеричноеЧисло: W_ШЕСТЕРИЧНОЕ_ЧИСЛО;
aСемиричноеЧисло: W_СЕМИРИЧНОЕ_ЧИСЛО;
aВосмеричноеЧисло: W_ВОСМЕРИЧНОЕ_ЧИСЛО;
aДевятеричноеЧисло: W_ДЕВЯТИРИЧНОЕ_ЧИСЛО;
aДесятеричноеЧисло: A_ДЕСЯТЕРИЧНОЕ_ЧИСЛО;
aШестнадцатиричноеЧисло: W_ШЕСТНАДЦАТИРИЧНОЕ_ЧИСЛО;
aЗнакЧисла: A_МИНУС | A_ПЛЮС;
aЧисло: aЗнакЧисла? (aДесятеричноеЧисло | (aБинарноеЧисло
	| aТритичноеЧисло
	| aЧетверичноеЧисор
	| aПятеричноеЧисло
	| aШестеричноеЧисло
	| aСемиричноеЧисло
	| aВосмеричноеЧисло
	| aДевятеричноеЧисло
	| aШестнадцатиричноеЧисло
));
aЕпсилонЧастьЧисла: PROBEL? ZNAK_EPSILON aЧисло;
aЧислоСПлавающейТочкой: aЧисло? TOCHKA aЧисло aЕпсилонЧастьЧисла?;
aПолныйВидЧисла: aЧисло | aЧислоСПлавающейТочкой;
//				   			 | W_НОМЕР_СЕМЬ    | W_НОМЕР_ВОСЕМЬ | W_НОМЕР_ДЕВЯТЬ;

// ФАЙЛ ОБЪХЕКТА StrokaFailovyPut
fragmentputi: FRAGMENTPUTI rashireniyeFaila?;
rashireniyeFaila: TOCHKA fragmentputi;
failovyPut: SOBAKA DELITELPUTI? fragmentputi (DELITELPUTI fragmentputi)*;

// ФАЙЛ ОБЪХЕКТА Stroki
shestnadcatirichnayaStroka: HEX_PREFIX PROBEL A_ШЕСТНАДЦАТИРИЧНЫЕ_СИМВОЛЫ;
lineynayaStroka: LineynayaStroka1 | LineynayaStroka2;
mnogostrochnayaStroka: MnogostrochieStroka1 | MnogostrochieStroka2;
stroka: (shestnadcatirichnayaStroka
	| lineynayaStroka
	| mnogostrochnayaStroka
	| failovyPut
	);
cheredaStrok: stroka (COMMA stroka)*;

// ФАЙЛ ОБЪХЕКТА Peremenniye
bulevoZnacheniye: TOKEN_BULEVA_ZNACHENIYA_LOJI | TOKEN_BULEVA_ZNACHENIYA_ISTINY;
strokoviyIdentifikator: ZNAKI_A_Z_ | UTF8CHARSET | KVANTIFIKATOR_IDENTIFIKATORA | KVANTIFIKATOR_IDENTIFIKATORA_POLN;
strokovayaIndeksaciya: strokoviyIdentifikator (TOCHKA strokoviyIdentifikator)+;
ssilkaNaObiekt: strokoviyIdentifikator | strokovayaIndeksaciya;

// ФАЙЛ ОБЪХЕКТА TokenModificatorVidimosti
modifikatorVidimostiPublichniy: PUBLICHNAYA;
modifikatorVidimostiPrivatniy: PRIVATNAYA;
modifikatorVidimosti: modifikatorVidimostiPublichniy | modifikatorVidimostiPrivatniy;

// ФАЙЛ ОБЪХЕКТА TokenTipPeremennoy
tipChislo: CHISLO | NUMBER | TOKEN_TIPA_CHISLA;
tipStroka: STRING | TOKEN_TIPA_STROKA;
tipFunkciya: METOD | METHOD | FUNCTION | TOKEN_TIPA_FUNCIYA;
tipBulevo: BOOLEAN | TOKEN_TIPA_BULEVO_ZNACHENIYE;
tipAvtomaticheskiy: AVTO | AUTO | TOKEN_TIPA_AVTOMAT;
tipPeremennoi: tipStroka
	| tipChislo
	| tipBulevo
	| tipFunkciya
	| tipAvtomaticheskiy;
perechisleniyeTipovPremennyh: tipPeremennoi (',' probelniy? tipPeremennoi)*;

// ФАЙЛ ОБЪХЕКТА Virajeniya
virajeniye: virajeniye operaciya=(UMNOJENIYE | DELENIYE | STEPENN) virajeniye // умножение / деление
		  | virajeniye operaciya=(A_ПЛЮС | A_МИНУС) 	   		   virajeniye // сложение / вычитание
		  | LEVAYASKOBKA virajeniye PRAVAYASKOBKA
		  | ssilkaNaObiekt
		  | aПолныйВидЧисла;

// ФАЙЛ ОБЪХЕКТА TokenModifikatorKonstantnosti
modificatorKonstanty: KKONSTANTA;

// ФАЙЛ ОБЪХЕКТА TokenModifikatory
modifikatorVidimostiKonstantnosti: (modifikatorVidimosti probelniy)? modificatorKonstanty?;

// ФАЙЛ ОБЪХЕКТА Yap
konstantnoyeZnacheniye: stroka | aПолныйВидЧисла | bulevoZnacheniye;
znacheniye: konstantnoyeZnacheniye | strokovayaIndeksaciya | virajeniye;
prisvoyeniyeZnacheniya: probelniy? '=' probelniy?  znacheniye (',' probelniy znacheniye)*;
opredeleniyeObjyavleniyePeremennoy:
	(modifikatorVidimostiKonstantnosti probelniy)? tipPeremennoi probelniy strokoviyIdentifikator
	prisvoyeniyeZnacheniya?;

// ФАЙЛ ОБЪХЕКТА Oglavleniye
PROBEL: ' ';
TOCHKA: '.';
COMMA: ',';
NL: '\n';
TABYLACIYA: '\t';
PROBELNIYODIN: PROBEL | TABYLACIYA;
PROBELNIY: (PROBEL | TABYLACIYA)+;
fragment UTF8CHARSET2: [\u0080-\u07FF];
fragment UTF8CHARSET3: [\u0800-\uFFFF];
fragment UTF8CHARSET4: [\u10000-\u10FFFF];
UTF8CHARSET: (UTF8CHARSET2 | UTF8CHARSET3 | UTF8CHARSET4)+;

// ФАЙЛ ОБЪХЕКТА Chisla2
W_НОМЕР_НОЛЬ: '0';
W_НОМЕР_ЕДИНИЦА: '1';
W_НОМЕР_ДВА: '2';
W_НОМЕР_ТРИ: '3';
W_НОМЕР_ЧЕТЫРЕ: '4';
W_НОМЕР_ПЯТЬ: '5';
W_НОМЕР_ШЕСТЬ: '6';
W_НОМЕР_СЕМЬ: '7';
W_НОМЕР_ВОСЕМЬ: '8';
W_НОМЕР_ДЕВЯТЬ: '9';
fragment A19: '1' .. '9';
fragment A09: '0' .. '9';
A_ДЕСЯТЕРИЧНОЕ_ЧИСЛО: A19 A09*;
fragment Bb: [bB];
A_ПРЕФИКС_БИНАРНОГО_ЧИСЛА: W_НОМЕР_НОЛЬ Bb PROBEL?;
W_БИНАРНОЕ_ЧИСЛО: 	  A_ПРЕФИКС_БИНАРНОГО_ЧИСЛА [01]+;
W_ТРИТИЧНОЕ_ЧИСЛО: 	  W_НОМЕР_НОЛЬ W_НОМЕР_ТРИ PROBEL ('0' .. '2')+;
W_ЧЕТВЕРИЧНОЕ_ЧИСЛО:  W_НОМЕР_НОЛЬ W_НОМЕР_ЧЕТЫРЕ PROBEL ('0' .. '3')+;
W_ПЯТЕРИЧНОЕ_ЧИСЛО:   W_НОМЕР_НОЛЬ W_НОМЕР_ПЯТЬ PROBEL ('0' .. '4')+;
W_ШЕСТЕРИЧНОЕ_ЧИСЛО:  W_НОМЕР_НОЛЬ W_НОМЕР_ШЕСТЬ PROBEL ('0' .. '5')+;
W_СЕМИРИЧНОЕ_ЧИСЛО:   W_НОМЕР_НОЛЬ W_НОМЕР_СЕМЬ PROBEL ('0' .. '6')+;
W_ВОСМЕРИЧНОЕ_ЧИСЛО:  W_НОМЕР_НОЛЬ W_НОМЕР_ВОСЕМЬ PROBEL ('0' .. '7')+;
W_ДЕВЯТИРИЧНОЕ_ЧИСЛО: W_НОМЕР_НОЛЬ W_НОМЕР_ДЕВЯТЬ PROBEL ('0' .. '8')+;
ZNAK_EPSILON: ('e' | 'E');
ZNAKI_A_F: [a-fA-F];
fragment Xx: [xX];
A_ШЕСТНАДЦАТИРИЧНЫЕ_СИМВОЛЫ: (A_ДЕСЯТЕРИЧНОЕ_ЧИСЛО | ZNAKI_A_F)+;
W_ШЕСТНАДЦАТИРИЧНОЕ_ЧИСЛО: W_НОМЕР_НОЛЬ Xx PROBEL* A_ШЕСТНАДЦАТИРИЧНЫЕ_СИМВОЛЫ;
A_МИНУС: '-';
A_ПЛЮС: '+';

// ФАЙЛ ОБЪХЕКТА StrokaFailovyPut
SOBAKA: '@';
DELITELPUTI: '/';
EKRANIROVANNIYDELITELPUTI: '\\ ';
FRAGMENTPUTI: (EKRANIROVANNIYDELITELPUTI | ~(' ' | '/' | '.'))+;

// ФАЙЛ ОБЪХЕКТА Stroki
LineynayaStroka1: '"' (~('"') | '\\"')* '"';
LineynayaStroka2: '\'' (~('\'') | '\\\'')* '\'';
MnogostrochieStroka1: '[[' .*? ']]';
MnogostrochieStroka2 : '![' .*? ']!';
HEX_PREFIX: 'hex!';

// ФАЙЛ ОБЪХЕКТА Peremenniye
TOKEN_BULEVA_ZNACHENIYA_ISTINY: 'Истина';
TOKEN_BULEVA_ZNACHENIYA_LOJI: 'Ложь';
ZNAKI_A_Z_: [a-zA-Z_];
KVANTIFIKATOR_IDENTIFIKATORA: ZNAKI_A_Z_ |  UTF8CHARSET;
KVANTIFIKATOR_IDENTIFIKATORA_POLN: KVANTIFIKATOR_IDENTIFIKATORA (A_ДЕСЯТЕРИЧНОЕ_ЧИСЛО | KVANTIFIKATOR_IDENTIFIKATORA)*;

// ФАЙЛ ОБЪХЕКТА TokenModificatorVidimosti
IYY: 'ый';
A: 'а';
YA: 'я';
AYA: A YA;
OE: 'ое';
O: 'о';
PUBLICH: 'публичн';
PRIVATN: 'приватн';
PUBLIC: 'public';
PRIVATE: 'private';
OKONCHANIYA: (IYY | AYA | OE | O);
PUBLICHNAYA: (PUBLICH OKONCHANIYA) | PUBLIC;
PRIVATNAYA: (PRIVATN OKONCHANIYA) | PRIVATE;

// ФАЙЛ ОБЪХЕКТА TokenTipPeremennoy
CHISLO: 'число';
V: 'в';
VOY: V 'ой';
VOE: V 'ое';
VOY_VOE: VOY | VOE;
ZNACHENIYE: 'значение';
NUMBER: 'number';
STROK: 'строк';
FUNKCI: 'функци';
STRING: 'string';
ONALNIY: 'ональный';
METOD: 'метод';
FUNCTION: 'function';
METHOD: 'method';
AVTO: 'авто';
MATICHESKIY: 'матический';
AUTO: 'auto';
BULEV: 'булев';
BOOLEAN: 'boolean';
POSTZNACHENIYE: PROBEL ZNACHENIYE;
TOKEN_TIPA_CHISLA: CHISLO (VOY | VOE)? POSTZNACHENIYE?;
TOKEN_TIPA_STROKA: STROK (A | O (V OKONCHANIYA));
TOKEN_TIPA_FUNCIYA: FUNKCI (YA | ONALNIY);
TOKEN_TIPA_AVTOMAT: AVTO MATICHESKIY?;
TOKEN_TIPA_BULEVO_ZNACHENIYE: BULEV ((O | OE) | OKONCHANIYA) POSTZNACHENIYE?;

// ФАЙЛ ОБЪХЕКТА Virajeniya
DELENIYE: '/';
UMNOJENIYE: '*';
STEPENN: '^';
LEVAYASKOBKA: '(';
PRAVAYASKOBKA: ')';

// ФАЙЛ ОБЪХЕКТА TokenModifikatorKonstantnosti
KONSTANTN: 'константн';
KONSTANT: 'konstant';
CONSTANT: 'constant';
KKONSTANTA: (KONSTANTN OKONCHANIYA) | KONSTANT | CONSTANT;

// ФАЙЛ ОБЪХЕКТА TokenModifikatory

// ФАЙЛ ОБЪХЕКТА Yap
TOKEN_RAVNO: '=';