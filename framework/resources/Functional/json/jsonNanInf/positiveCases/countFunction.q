set store.json.reader.allow_nan_inf = true;
--@test
select t.name, count(t.attr4) from `jsonNanInf/aggr.json` t group by t.name
union all
select t.name, count(distinct t.attr4) from `jsonNanInf/aggr.json` t group by t.name;
reset store.json.reader.allow_nan_inf;
