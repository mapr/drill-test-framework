select flatten(d.events), flatten(d.map.rm[0].rptd), flatten(d.features) from `data.json` d where features[0].type='Feature' and d.events[0].type='cmpgn1';
