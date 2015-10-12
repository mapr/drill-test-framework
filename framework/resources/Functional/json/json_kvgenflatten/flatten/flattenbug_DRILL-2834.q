select flatten(t1.lst_lst), flatten(t1.events) from `json_kvgenflatten/data.json` t1 inner join `json_kvgenflatten/data.json` t2 on t1.uid = t2.uid;
