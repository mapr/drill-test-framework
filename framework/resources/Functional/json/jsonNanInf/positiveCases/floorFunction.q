set store.json.reader.allow_nan_inf = true;
--@test
select floor(Nan) NaN, floor(Positive_Infinity) POS_INF, floor(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
