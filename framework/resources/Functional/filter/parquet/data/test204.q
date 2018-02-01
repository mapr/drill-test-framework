--keep partition 1, 2, 3, 5 from orders_parts and 1, 2, 3 from orders_parts_hive.  Count is 6009.
select count(*) from (select t1.int_id as t1_int_id, t2.float_id as t2_float_id from orders_parts t1, orders_parts_hive t2 where t1.int_id = t2.int_id and t1.int_id > -3000 and t1.float_id < 11000 and t2.int_id > -10 and t2.float_id < 6000) where t1_int_id > -3000 or t2_float_id < -6;
