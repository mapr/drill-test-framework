set store.json.reader.allow_nan_inf = true;
--@test
select divide(Nan, 5.00), divide(Positive_Infinity, 5.00), divide(Negative_Infinity, 5.00) from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
