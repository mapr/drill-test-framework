set store.json.reader.allow_nan_inf = true;
--@test
select tanh(Nan) NaN, tanh(Positive_Infinity) POS_INF, tanh(Negative_Infinity) NEG_INF from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
