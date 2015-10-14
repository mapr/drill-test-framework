-- Right outer join in not in clause
select sum(c_bigint) from j2 where c_varchar not in ( select concat(j5.c_varchar,j1.c_varchar) from j1 right outer join j5 on (j1.c_integer = j5.c_integer and j1.c_boolean is not null) );
