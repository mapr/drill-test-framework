set store.json.reader.allow_nan_inf = true;
--@test
select cos(Nan) NaN, cos(Positive_Infinity) POS_INF, cos(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
