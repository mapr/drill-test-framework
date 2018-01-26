set store.json.reader.allow_nan_inf = true;
--@test
select multiply(Nan, 5.00), multiply(Positive_Infinity, 5.00), multiply(Negative_Infinity, 5.00) from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
