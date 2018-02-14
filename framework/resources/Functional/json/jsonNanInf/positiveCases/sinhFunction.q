set store.json.reader.allow_nan_inf = true;
--@test
select sinh(Nan) NaN, sinh(Positive_Infinity) POS_INF, sinh(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
