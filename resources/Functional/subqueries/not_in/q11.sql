-- Left outer join in not in clause
select avg(c_bigint) from j2 where c_varchar not in ( select concat(j5.c_varchar,j1.c_varchar) from j5 left outer join j1 on (j1.c_integer = j5.c_integer and j1.c_boolean is not null) ) and c_boolean is not true;
