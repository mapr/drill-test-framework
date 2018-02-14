set store.json.reader.allow_nan_inf = true;
--@test
select equal(Nan, Nan1), equal(Positive_Infinity, Positive_Infinity1), equal(Negative_Infinity, Negative_Infinity1) from `jsonNanInf/PN_Inf_NaN.json`;
reset store.json.reader.allow_nan_inf;
