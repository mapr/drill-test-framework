set store.json.reader.allow_nan_inf = true;
--@test
select t.name, avg(t.attr4) from `jsonNanInf/aggr.json` t group by t.name;
reset store.json.reader.allow_nan_inf;
