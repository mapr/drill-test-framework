select s.uid, s.rms.mapvalue.col2[0] from (select d.uid, flatten(d.map.rm) rms from `data.json` d where d.map.rm[0].rptd[0].a = 'foo' or d.sub[1].z2=10) s;
