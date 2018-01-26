set store.json.reader.allow_nan_inf = true;
--@test
select exp(Nan) NaN, exp(Positive_Infinity) POS_INF, exp(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
