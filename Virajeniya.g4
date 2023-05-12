grammar Virajeniya;

import Chisla2, Peremenniye;


virajeniye: virajeniye operaciya=(UMNOJENIYE | DELENIYE | STEPENN) virajeniye // умножение / деление
		  | virajeniye operaciya=(A_ПЛЮС | A_МИНУС) 	   		   virajeniye // сложение / вычитание
		  | LEVAYASKOBKA virajeniye PRAVAYASKOBKA
		  | ssilkaNaObiekt
		  | aПолныйВидЧисла
		 ;
		 
		 
		 




DELENIYE: '/';
UMNOJENIYE: '*';
STEPENN: '^';
LEVAYASKOBKA: '('; PRAVAYASKOBKA: ')';


