create table dfs.ctas_flatten.`test` as select uid, flatten(lst_lst) lst, flatten(lst_lst[0]) from `data1.json` order by flatten(lst_lst[0]);
