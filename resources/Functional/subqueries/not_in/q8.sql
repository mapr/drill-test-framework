-- Aggregation with grouping in not in clause
select * from j2 where c_float not in ( select max(c_integer) from j6 group by c_date having count(*) > 0 and c_date is not null);
