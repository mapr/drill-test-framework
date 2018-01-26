set store.json.reader.allow_nan_inf = true;
--@test
select abs(Nan) NaN, abs(Positive_Infinity) POS_INF, abs(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
