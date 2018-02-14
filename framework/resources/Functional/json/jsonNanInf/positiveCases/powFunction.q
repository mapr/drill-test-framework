set store.json.reader.allow_nan_inf = true;
--@test
select pow(Nan, 5.00), pow(Positive_Infinity, 5.00), pow(Negative_Infinity, 5.00) from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
