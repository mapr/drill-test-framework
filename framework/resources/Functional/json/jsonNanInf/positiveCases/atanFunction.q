set store.json.reader.allow_nan_inf = true;
--@test
select atan(Nan) NaN, atan(Positive_Infinity) POS_INF, atan(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
