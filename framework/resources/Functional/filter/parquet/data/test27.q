-- keep partitions 2, 3, 5
select count(*) from orders_parts where (date_id >= '2016-10-03' and date_id <= '2019-06-29') or (date_id >= '2027-09-16' and date_id <= '2030-06-11') or (date_id >= '2042-10-07' and date_id <= '2045-07-02');
