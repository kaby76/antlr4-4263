grammar InstrykciyaKlass;
import Oglavleniye, Peremenniye, TokenModificatorVidimosti;


opredeleniyeKlassa: (modifikatorVidimosti probelniy)?
	TOKEN_OPREDELENIYA_KLASSA ' '+ strokoviyIdentifikator ( ' '+ TOKEN_OPREDELENIYA_KLASSA_NASLEDOVANIYA_0 probelniy ssilkaNaObiekt (',' probelniy* ssilkaNaObiekt)*)?;

 



 
TOKEN_OPREDELENIYA_KLASSA: '\u043a\u043b\u0430\u0441\u0441' | 'class'; //класс

TOKEN_OPREDELENIYA_KLASSA_NASLEDOVANIYE: 'наследование от';
TOKEN_OPREDELENIYA_KLASSA_NASLEDUETSYA_OT: 'наследуется от';

TOKEN_OPREDELENIYA_KLASSA_NASLEDOVANIYA_0:
	  TOKEN_OPREDELENIYA_KLASSA_NASLEDOVANIYE
	| TOKEN_OPREDELENIYA_KLASSA_NASLEDUETSYA_OT
	| 'inherits'
	;
