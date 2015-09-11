select  s.trans  from (select d.max_trans_amount mx, flatten(d.transactions) trans from `data.json` d) s where s.trans.amount = s.mx;
