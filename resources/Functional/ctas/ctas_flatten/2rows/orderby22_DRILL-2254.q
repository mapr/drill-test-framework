create table dfs.ctas_flatten.`orderby22_DRILL-2254_ctas` as select uid, flatten(d.lst_lst[1]) lst1, flatten(d.lst_lst[0]) lst0, flatten(d.lst_lst) lst from `data.json` d order by d.lst_lst[0][0], d.events[0].event_time;
select * from dfs.ctas_flatten.`orderby22_DRILL-2254_ctas`;
select 1 from sys.options;
