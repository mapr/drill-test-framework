drop table if exists dfs.ctas_flatten.`filter15_100000rows_ctas`;
create table dfs.ctas_flatten.`filter15_100000rows_ctas` as select  s.trans  from (select d.max_trans_amount mx, flatten(d.transactions) trans from `data.json` d) s where s.trans.amount = s.mx;
--@test
select * from dfs.ctas_flatten.`filter15_100000rows_ctas`;
drop table dfs.ctas_flatten.`filter15_100000rows_ctas`;
