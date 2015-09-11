select s.rptds from (select d.type type, flatten(d.map.rm[1].rptd) rptds, flatten(d.features) feats from `data.json` d) s where s.rptds.c < s.feats.properties.mag and s.type='web';
