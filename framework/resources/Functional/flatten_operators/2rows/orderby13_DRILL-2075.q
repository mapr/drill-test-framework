select  s.evnts.evnt_id  from (select d.type type, flatten(d.events) evnts from `data.json` d where d.type='web' order by d.uid) s where s.evnts.type = 'cmpgn4' and s.type='web';
