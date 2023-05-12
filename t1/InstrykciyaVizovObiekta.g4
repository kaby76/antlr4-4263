grammar InstrykciyaVizovObiekta;
import Oglavleniye, Peremenniye, Virajeniya;

argumentVizova: ssilkaNaObiekt | virajeniye;
argumentyVizova: argumentVizova (',' probelniy argumentVizova)*;
   
instrykciyaVizovaObiekta: '(' argumentyVizova? ')';