select  *  from (select d.type type, flatten(d.events) evnts from `schema_changes` d where d.type='web') s where s.evnts.type = 'cmpgn4';
