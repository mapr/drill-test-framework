select  flatten(s1.lst) lst1, s1.lst from (select uid, flatten(d.lst_lst) lst from `data.json` d) s1;
