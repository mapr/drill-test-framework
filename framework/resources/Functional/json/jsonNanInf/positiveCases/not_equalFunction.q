set store.json.reader.allow_nan_inf = true;
--@test
select not_equal(Nan, Nan1), not_equal(Positive_Infinity, Positive_Infinity1), not_equal(Negative_Infinity, Negative_Infinity1) from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
