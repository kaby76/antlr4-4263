grammar InstrykciyaFunkciya;
import TokenTipPeremennoy, TokenModificatorVidimosti, Peremenniye, Oglavleniye;

paraNazvaniyeTipArgumenta: tipPeremennoi probelniy strokoviyIdentifikator;
perechisleniyeParArgumentov: paraNazvaniyeTipArgumenta (',' probelniy? paraNazvaniyeTipArgumenta)*;
argumentiVozvrataFunkcii: ':' probelniy? perechisleniyeTipovPremennyh;
opredeleniyeArgumentovFunkcii: '(' perechisleniyeParArgumentov? ')';
  
zagolovokAgumentyFuncii: opredeleniyeArgumentovFunkcii probelniy? argumentiVozvrataFunkcii;

//lambdaFunkciya: zagolovokAgumentyFuncii;


funkciyaInstrykciya: (modifikatorVidimosti probelniy)? tipFunkciya probelniy nazvaniye=strokoviyIdentifikator probelniy? zagolovokAgumentyFuncii;

