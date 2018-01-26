set store.json.reader.allow_nan_inf = true;
--@test
select negative(Nan), negative(Positive_Infinity), negative(Negative_Infinity) from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
