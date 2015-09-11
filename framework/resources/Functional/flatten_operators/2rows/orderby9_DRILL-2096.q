select s.uid, s.rms.rptd from (select d.uid, flatten(d.map.rm) rms from `data.json` d) s order by s.rms.mapid;
