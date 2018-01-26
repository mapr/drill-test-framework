set store.json.reader.allow_nan_inf = true;
--@test
select isnull(Nan), isnull(Positive_Infinity), isnull(Negative_Infinity) from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
