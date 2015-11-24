create table dfs.ctas_flatten.`general0_DRILL-2161_100000rows_ctas` as select uid, flatten(d.lst_lst) lst from `data.json` d;
select * from dfs.ctas_flatten.`general0_DRILL-2161_100000rows_ctas`;
drop table dfs.ctas_flatten.`general0_DRILL-2161_100000rows_ctas`;
