select MAX(sub.val) from (select flatten(d.lst_lst[0]) val from `data1.json` d) sub;
