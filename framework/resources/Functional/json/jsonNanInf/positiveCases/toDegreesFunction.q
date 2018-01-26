set store.json.reader.allow_nan_inf = true;
--@test
select degrees(Nan) NaN, degrees(Positive_Infinity) POS_INF, degrees(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
