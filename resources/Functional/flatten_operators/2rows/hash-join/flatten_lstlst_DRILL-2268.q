select flatten(t1.lst_lst) from `data.json` t1 inner join `data.json` t2 on t1.uid = t2.uid;
