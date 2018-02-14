set store.json.reader.allow_nan_inf = true;
--@test
select sin(Nan) NaN, sin(Positive_Infinity) POS_INF, sin(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
