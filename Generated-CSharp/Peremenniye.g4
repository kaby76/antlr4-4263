grammar Peremenniye;
import Chisla2;
import Oglavleniye;
 
bulevoZnacheniye: TOKEN_BULEVA_ZNACHENIYA_LOJI | TOKEN_BULEVA_ZNACHENIYA_ISTINY;

 
strokoviyIdentifikator: ZNAKI_A_Z_ | UTF8CHARSET | KVANTIFIKATOR_IDENTIFIKATORA | KVANTIFIKATOR_IDENTIFIKATORA_POLN;
strokovayaIndeksaciya: strokoviyIdentifikator (TOCHKA strokoviyIdentifikator)+;

// Название переменной, поля объекта или модуля.
ssilkaNaObiekt: strokoviyIdentifikator | strokovayaIndeksaciya;


 

TOKEN_BULEVA_ZNACHENIYA_ISTINY: 'Истина'; // Истина
TOKEN_BULEVA_ZNACHENIYA_LOJI: 'Ложь'; // Ложь.

ZNAKI_A_Z_: [a-zA-Z_];

KVANTIFIKATOR_IDENTIFIKATORA: ZNAKI_A_Z_ |  UTF8CHARSET;
KVANTIFIKATOR_IDENTIFIKATORA_POLN: KVANTIFIKATOR_IDENTIFIKATORA (DesyaterichniyeChisla | KVANTIFIKATOR_IDENTIFIKATORA)*;