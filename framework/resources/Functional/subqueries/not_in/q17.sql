-- limit offset
select count(*) from j1 where c_float not in ( select max(c_integer) from j6 group by c_date having count(*) > 0 limit 3);
