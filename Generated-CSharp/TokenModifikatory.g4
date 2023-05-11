grammar TokenModifikatory;

import Oglavleniye;
import TokenModificatorVidimosti;
import TokenModifikatorKonstantnosti;

//modifikator: modifikatorVidimosti | modificatorKonstanty;

modifikatorVidimostiKonstantnosti: (modifikatorVidimosti probelniy)? modificatorKonstanty?;