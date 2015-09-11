select uid, flatten(lst_lst[0]) from `data.json` where 2 in (select flatten(lst_lst[1]) from `data.json`);
