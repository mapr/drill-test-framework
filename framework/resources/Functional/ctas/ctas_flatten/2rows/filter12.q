create table dfs_test.ctas_flatten.`filter12_ctas` as select flatten(d.events), flatten(d.map.rm[0].rptd), flatten(d.features) from `data.json` d where features[0].type='Feature' and d.events[0].type='cmpgn1';
select * from dfs_test.ctas_flatten.`filter12_ctas`;
drop table dfs_test.ctas_flatten.`filter12_ctas`;
