grammar TokenModifikatorKonstantnosti;
import TokenModificatorVidimosti;


modificatorKonstanty: KKONSTANTA;

KONSTANTN: 'константн';
KONSTANT: 'konstant';
CONSTANT: 'constant';

KKONSTANTA: (KONSTANTN OKONCHANIYA) | KONSTANT | CONSTANT;