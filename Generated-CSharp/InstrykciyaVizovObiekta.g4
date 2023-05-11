grammar InstrykciyaVizovObiekta;
import Oglavleniye;
import Peremenniye;
import Virajeniya;

argumentVizova: ssilkaNaObiekt | virajeniye;
argumentyVizova: argumentVizova (',' probelniy argumentVizova)*;
   
instrykciyaVizovaObiekta: '(' argumentyVizova? ')';