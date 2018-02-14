set store.json.reader.allow_nan_inf = true;
--@test
select trunc(Nan, 3), trunc(Positive_Infinity, 3), trunc(Negative_Infinity, 3) from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
