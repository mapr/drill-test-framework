select s1.type type, flatten(s1.rms.rptd) rptds from (select d.type type, d.uid uid, flatten(d.map.rm) rms from `data.json` d order by d.uid) s1 ;
