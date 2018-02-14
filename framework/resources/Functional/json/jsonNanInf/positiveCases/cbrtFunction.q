set store.json.reader.allow_nan_inf = true;
--@test
select cbrt(Nan) NaN, cbrt(Positive_Infinity) POS_INF, cbrt(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
