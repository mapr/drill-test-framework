select * from `data.json` where 2 in (select flatten(lst_lst[0]) from `data.json`);
