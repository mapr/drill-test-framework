create or replace view v1_joins (a, b, c, d)
as
select sq1.x, sq1.y, sq2.x, sq2.y 
from
	(
	select   c_date, 
         	 avg(c_integer) 
	from     j1 
	group by 
		c_date 
	) sq1(x, y) 
	left outer join 
	( 
	select  c_date, 
		avg(c_integer) 
	from    j3 
	group by c_date ) as sq2(x, y) 
on ( sq1.x = sq2.x and sq2.y < 0 ) 
where 
	sq2.x is not null 
	and sq2.y is not null;

-- Inner join with complex view and two tables
select * from v1_joins, j2 where v1_joins.a = j2.c_date;
