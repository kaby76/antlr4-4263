grammar Stroki;
import Chisla2;
import StrokaFailovyPut;
import Oglavleniye;


//zZNAKI_A_F_0_9: SHESHNADTCATIRICHNOYE_CHISLO;
//HEX STROKA.
shestnadcatirichnayaStroka: HEX_PREFIX SHESHNADTCATIRICHNOYE_CHISLO; 

lineynayaStroka: LineynayaStroka1 | LineynayaStroka2;

mnogostrochnayaStroka: MnogostrochieStroka1 | MnogostrochieStroka2;

stroka: (shestnadcatirichnayaStroka
	| lineynayaStroka
	| mnogostrochnayaStroka
	| failovyPut
	)
	; 


cheredaStrok: stroka (COMMA stroka)*;










LineynayaStroka1: '"' (~('"') | '\\"')* '"';
LineynayaStroka2: '\'' (~('\'') | '\\\'')* '\'';
MnogostrochieStroka1: '[[' .*? ']]';
MnogostrochieStroka2 : '![' .*? ']!';

HEX_PREFIX: 'hex!';

