set store.json.reader.allow_nan_inf = true;
--@test
select acos(Nan) NaN, acos(Positive_Infinity) POS_INF, acos(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
