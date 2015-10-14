select d.uid, flatten(d.map.rm), flatten(d.events) from `data.json` d where d.map.rm[0].rptd[0].a = 'foo1' and d.events[4].type = 'cmpgn2';
