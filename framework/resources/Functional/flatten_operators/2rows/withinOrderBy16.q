select * from `data.json` where 99 in (select flatten(lst_lst[0]) from `data.json`);
