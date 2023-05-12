grammar InstrukciyaImportirovat;
import Peremenniye;
import StrokaFailovyPut;
import Oglavleniye;
   
importirovatKak: TOKEN_KAK probelniy strokovayaIndeksaciya;
importirovatIz: TOKEN_IZ probelniy ( strokovayaIndeksaciya | failovyPut);
importirovatIzChereda: importirovatIz (probelniy importirovatIz)*;
importirovatInstrukciya: TOKEN_IMPORTIROVAT probelniy strokovayaIndeksaciya
	(probelniy importirovatIz)?
	(probelniy importirovatKak)?;
	

importirovatInstrukciyaChereda: (importirovatInstrukciya NL?)* EOF;
 

 





//импортировать
TOKEN_IMPORTIROVAT: '\u0438\u043c\u043f\u043e\u0440\u0442\u0438\u0440\u043e\u0432\u0430\u0442\u044c';
TOKEN_KAK: '\u043a\u0430\u043a'; //как

// из
TOKEN_IZ: '\u0438\u0437';