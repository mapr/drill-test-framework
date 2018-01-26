set store.json.reader.allow_nan_inf = true;
--@test
select t.name, t.attr4 from `jsonNanInf/aggr.json` t
union all
select tt.name, tt.attr4 from `jsonNanInf/aggr.json` tt;
reset store.json.reader.allow_nan_inf;
