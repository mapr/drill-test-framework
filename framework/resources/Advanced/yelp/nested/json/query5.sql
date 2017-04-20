select count(distinct t.v.key) as c from (select flatten(kvgen(votes)) as v from review) as t order by c limit 20;
