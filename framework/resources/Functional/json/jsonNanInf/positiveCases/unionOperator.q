set store.json.reader.allow_nan_inf = true;
--@test
select t1.Positive_infinity, t1.Negative_infinity from `jsonNanInf/PN_Inf_NaN.json` t1
union
select t2.Positive_infinity, t2.Negative_infinity from `jsonNanInf/PN_Inf_NaN.json` t2;
reset store.json.reader.allow_nan_inf;
