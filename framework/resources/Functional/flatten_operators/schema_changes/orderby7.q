select s.uid from (select d.uid, flatten(d.map.rm) rms from `schema_changes` d) s order by s.rms.rptd[1].d;
