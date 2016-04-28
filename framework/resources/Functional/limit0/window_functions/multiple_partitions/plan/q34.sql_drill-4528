explain plan for select * from (
-- two different window clauses with GROUP BY
-- aggregate function, windowed aggregate, rank()
-- only order by clause in window definition
select
        avg(c_integer),
        rank()   over (order by c_date),
        avg(c_integer) over (partition by c_boolean order by c_date desc),
        sum(c_integer) over (partition by c_boolean order by c_date desc)
from
        j1_v
group by
	c_boolean,
        c_integer,
        c_date
order by
        row_number()   over (order by c_date)

) t limit 0;
