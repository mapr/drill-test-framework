select d.uid, flatten(d.map.rm) from `data.json` d where d.map.rm[0].rptd[0].a = 'foo';
