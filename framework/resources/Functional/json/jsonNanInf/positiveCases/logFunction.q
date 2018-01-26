set store.json.reader.allow_nan_inf = true;
--@test
select log(Nan) NaN, log(Positive_Infinity) POS_INF, log(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
