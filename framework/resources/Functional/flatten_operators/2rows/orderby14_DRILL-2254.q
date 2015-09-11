select uid, lst_lst, d.lst_lst[1], flatten(d.lst_lst) lst from `data.json` d order by d.lst_lst[1][2];
