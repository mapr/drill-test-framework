set store.json.reader.allow_nan_inf = true;
--@test
select less_than_or_equal_to(Nan, Nan1), less_than_or_equal_to(Positive_Infinity, Positive_Infinity1), less_than_or_equal_to(Negative_Infinity, Negative_Infinity1) from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
