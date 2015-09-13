select count(*) from (select t.id, kvgen(t.soa[0]) from `complex.json` t);
