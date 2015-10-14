create table dfs.ctas_flatten.`functions1_ctas` as select MAX(sub.val) from (select flatten(d.lst_lst[0]) val from `data1.json` d) sub;
select * from dfs.ctas_flatten.`functions1_ctas`;
select 1 from sys.options;
