set store.json.reader.allow_nan_inf = true;
--@test
select mod(Nan, 5.00), mod(Positive_Infinity, 5.00), mod(Negative_Infinity, 5.00) from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
