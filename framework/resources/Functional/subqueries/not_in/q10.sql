-- Inner join in not in clause
select * from j5 where c_varchar not in ( select UPPER(j1.c_varchar) from j1, j2 where j1.c_integer = j2.c_integer and j2.c_date is not null);
