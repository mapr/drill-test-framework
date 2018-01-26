set store.json.reader.allow_nan_inf = true;
--@test
select ceil(Nan) NaN, ceil(Positive_Infinity) POS_INF, ceil(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
