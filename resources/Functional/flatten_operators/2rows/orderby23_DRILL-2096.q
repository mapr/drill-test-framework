select rptd from (select uid, d.map.rm[0].rptd rptd, flatten(d.lst_lst[1]) lst1, flatten(d.lst_lst[0]) lst0, flatten(d.lst_lst) lst from `data.json` d) s1 order by s1.lst1;
