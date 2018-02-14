set store.json.reader.allow_nan_inf = true;
--@test
select radians(Nan) NaN, radians(Positive_Infinity) POS_INF, radians(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
