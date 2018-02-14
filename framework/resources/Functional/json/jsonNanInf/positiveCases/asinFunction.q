set store.json.reader.allow_nan_inf = true;
--@test
select asin(Nan) NaN, asin(Positive_Infinity) POS_INF, asin(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
