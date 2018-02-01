-- keep partitions 1,2,3,5.  count is 4.
explain plan for select * from orders_parts where (date_id = '2008-07-17') or (date_id = '2016-10-03') or (date_id = '2027-09-16') or (date_id = '2042-10-07');
