grammar TokenModificatorVidimosti;


modifikatorVidimostiPublichniy: PUBLICHNAYA;
modifikatorVidimostiPrivatniy: PRIVATNAYA;
modifikatorVidimosti: modifikatorVidimostiPublichniy | modifikatorVidimostiPrivatniy;


IYY: 'ый';
A: 'а';
YA: 'я';
AYA: A YA;
OE: 'ое';
O: 'о';
PUBLICH: 'публичн';
PRIVATN: 'приватн';
PUBLIC: 'public';
PRIVATE: 'private';
OKONCHANIYA: (IYY | AYA | OE | O);
PUBLICHNAYA: (PUBLICH OKONCHANIYA) | PUBLIC;
PRIVATNAYA: (PRIVATN OKONCHANIYA) | PRIVATE;