select flatten(s2.l1_list), s2.l1_list from (select s1.uid, s1.l1_list l1_list from (select uid, flatten(d.lst_lst) l1_list from `data.json` d) s1) s2;
