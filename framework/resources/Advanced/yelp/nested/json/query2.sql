select b.c as categories, count(b.c) as countOfCategories
from (select flatten(categories) c
from business )b
group by b.c
order by b.c  desc       
limit 20;
