select flatten(lst) from (select uid, flatten(d.lst_lst[1]) lst1, flatten(d.lst_lst) lst from `data.json` d) s1 order by s1.lst[3];
