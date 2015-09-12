select t.gbyt, count(t.id), max(t.id), min(t.id), avg(t.id) from `complex.json` t where t.bool = 'true' group by t.gbyt order by t.gbyt;
