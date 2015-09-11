select  *  from (select d.type type, flatten(d.events) evnts from `data.json` d where d.type='web') s where s.evnts.type = 'cmpgn4';
