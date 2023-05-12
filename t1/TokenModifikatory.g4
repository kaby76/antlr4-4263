grammar TokenModifikatory;

import Oglavleniye, TokenModificatorVidimosti, TokenModifikatorKonstantnosti;

//modifikator: modifikatorVidimosti | modificatorKonstanty;

modifikatorVidimostiKonstantnosti: (modifikatorVidimosti probelniy)? modificatorKonstanty?;