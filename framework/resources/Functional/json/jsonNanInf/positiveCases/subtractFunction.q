set store.json.reader.allow_nan_inf = true;
--@test
select subtract(Nan, 5.00), subtract(Positive_Infinity, 5.00), subtract(Negative_Infinity, 5.00) from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
