set store.json.reader.allow_nan_inf = true;
--@test
select tan(Nan) NaN, tan(Positive_Infinity) POS_INF, tan(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
