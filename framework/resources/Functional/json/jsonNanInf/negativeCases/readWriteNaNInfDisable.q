set store.json.reader.allow_nan_inf = false;
--@test
select Nan, Positive_Infinity, Negative_Infinity NEG_INF from `jsonNanInf/aggr.json`;
reset store.json.reader.allow_nan_inf;
