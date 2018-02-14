set store.json.reader.allow_nan_inf = true;
--@test
select add(Nan, 5.00), add(Positive_Infinity, 5.00), add(Negative_Infinity, 5.00) from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
