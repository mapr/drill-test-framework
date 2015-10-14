with tmp as (select flatten(t.soa) as newdata from `complex.json` t limit 1) select kvgen(tmp.newdata) from tmp;
