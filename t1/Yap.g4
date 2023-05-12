grammar Yap;
import Oglavleniye, Stroki, Chisla2, Peremenniye, TokenTipPeremennoy, Virajeniya, TokenModificatorVidimosti,
	TokenModifikatory;

// Константное значение, любое число или строка, или булево значение и т.п.
konstantnoyeZnacheniye: stroka | aПолныйВидЧисла | bulevoZnacheniye;

znacheniye: konstantnoyeZnacheniye | strokovayaIndeksaciya | virajeniye;
  

prisvoyeniyeZnacheniya: probelniy? '=' probelniy?  znacheniye (',' probelniy znacheniye)* ;
opredeleniyeObjyavleniyePeremennoy:
	(modifikatorVidimostiKonstantnosti probelniy)? tipPeremennoi probelniy strokoviyIdentifikator
	prisvoyeniyeZnacheniya?;


TOKEN_RAVNO: '=';