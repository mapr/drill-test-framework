select s.uid from (select d.uid, flatten(d.map.rm) rms from `data.json` d) s order by s.rms.rptd[2].d;
