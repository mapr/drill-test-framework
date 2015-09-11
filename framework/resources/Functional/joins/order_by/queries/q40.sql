select count(*),
		count(sq1.a1),
		count(sq2.a2),
		min(sq1.a1),
		max(sq1.a1),
		min(sq2.a2),
		max(sq2.a2),
		avg(sq1.a1),
		avg(sq2.a2)
from
        (select c_integer, c_date from j1 order by c_integer desc nulls first) as sq1(a1, b1)
        inner join
        (select c_integer, c_date from j2 order by c_integer desc) as sq2(a2, b2)
        on (sq1.a1 = sq2.a2);
