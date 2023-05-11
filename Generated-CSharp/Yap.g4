grammar Yap;
import Oglavleniye;
import Stroki;
import Chisla2;
import Peremenniye;
import TokenTipPeremennoy;
import Virajeniya;
import TokenModificatorVidimosti;
import TokenModifikatory;

// Константное значение, любое число или строка, или булево значение и т.п.
konstantnoyeZnacheniye: stroka | polniyVidChisla | bulevoZnacheniye;

znacheniye: konstantnoyeZnacheniye | strokovayaIndeksaciya | virajeniye;
  

prisvoyeniyeZnacheniya: probelniy? '=' probelniy?  znacheniye (',' probelniy znacheniye)* ;
opredeleniyeObjyavleniyePeremennoy:
	(modifikatorVidimostiKonstantnosti probelniy)? tipPeremennoi probelniy strokoviyIdentifikator
	prisvoyeniyeZnacheniya?;


TOKEN_RAVNO: '=';