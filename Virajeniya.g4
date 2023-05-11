grammar Virajeniya;

import Chisla2;
import Peremenniye;


virajeniye: virajeniye operaciya=(UMNOJENIYE | DELENIYE | STEPENN) virajeniye // умножение / деление
		  | virajeniye operaciya=(PLUS | MINUS) 	   			   virajeniye // сложение / вычитание
		  | LEVAYASKOBKA virajeniye PRAVAYASKOBKA
		  | ssilkaNaObiekt
		  | polniyVidChisla
		 ;
		 
		 
		 




DELENIYE: '/';
UMNOJENIYE: '*';
STEPENN: '^';
LEVAYASKOBKA: '('; PRAVAYASKOBKA: ')';


