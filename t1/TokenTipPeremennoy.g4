grammar TokenTipPeremennoy;
import Peremenniye, Stroki, Oglavleniye, TokenModificatorVidimosti;


tipChislo: CHISLO | NUMBER | TOKEN_TIPA_CHISLA;
tipStroka: STRING | TOKEN_TIPA_STROKA;
tipFunkciya: METOD | METHOD | FUNCTION | TOKEN_TIPA_FUNCIYA;
tipBulevo: BOOLEAN | TOKEN_TIPA_BULEVO_ZNACHENIYE;
tipAvtomaticheskiy: AVTO | AUTO | TOKEN_TIPA_AVTOMAT;

tipPeremennoi: tipStroka
	| tipChislo
	| tipBulevo
	| tipFunkciya
	| tipAvtomaticheskiy
;


perechisleniyeTipovPremennyh: tipPeremennoi (',' probelniy? tipPeremennoi)*;


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


