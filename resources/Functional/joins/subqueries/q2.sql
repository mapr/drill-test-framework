-- Left outer join 
-- Join column is a "group by column" in both subqueries
-- Join column is the same type
-- Result of aggregation on top of "left outer joined" views is joined with the table

select * from j4 
where 
	c_date IN (
		select 
			sq1.x
		from
			(
			select 
				c_date,
				avg(c_integer)
			from
				j1
			group by
				c_date
			) as sq1(x, y)
		left outer join
			(
			select
				c_date,
				avg(c_integer)
			from 
				j3
			group by
				c_date	
			) as sq2(x, y)
		on  (sq1.x = sq2.x and sq2.y < 0)
		where
			sq2.x is not null
			and sq2.y is not null
		)
;
