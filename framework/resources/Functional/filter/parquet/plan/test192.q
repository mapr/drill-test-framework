--keep partition 1, 2, 3 for orders_parts and 1 for orders_parts_hive.  Count is 996.
explain plan for select count(*) from orders_parts t1, orders_parts_hive t2 where t1.int_id = t2.int_id and (t1.int_id > -3000) and (t2.int_id < -2000) and (t2.date_id > date '2008-07-20') and (t1.date_id <  date '2030-06-13');
