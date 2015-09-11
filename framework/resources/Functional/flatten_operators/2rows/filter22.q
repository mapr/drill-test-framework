select  s.rms.mapid  from (select d.type type, flatten(d.map.rm) rms from `data.json` d where d.map.rm[0].mapid='m1') s where s.rms.mapid='m0';
