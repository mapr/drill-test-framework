--keep partition 1.  Count is 632.
explain plan for select count(*) from orders_parts t1, orders_parts t2 where t1.int_id = t2.int_id and (t1.int_id > -3000) and (t2.int_id < -2000) and (t2.date_id > date '2008-07-20') and (t1.date_id <  date '2010-04-14');
