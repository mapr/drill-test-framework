set store.json.reader.allow_nan_inf = true;
--@test
select round(Nan) NaN, round(Positive_Infinity) POS_INF, round(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
