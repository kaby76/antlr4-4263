grammar StrokaFailovyPut;
import Oglavleniye;

fragmentputi: FRAGMENTPUTI rashireniyeFaila?;
rashireniyeFaila: TOCHKA fragmentputi;
failovyPut: SOBAKA DELITELPUTI? fragmentputi (DELITELPUTI fragmentputi)*;

SOBAKA: '@';
DELITELPUTI: '/';
EKRANIROVANNIYDELITELPUTI: '\\ ';
FRAGMENTPUTI: (EKRANIROVANNIYDELITELPUTI | ~(' ' | '/' | '.'))+;

