explain plan for select * from (
select 
        rnum, 
        a1, 
        ntile(4) over(order by a1) 
from 
        (
        select 
                a1, 
                row_number() over(order by a1) as rnum 
        from 
                t1_v
        ) as dt
) t limit 0;
