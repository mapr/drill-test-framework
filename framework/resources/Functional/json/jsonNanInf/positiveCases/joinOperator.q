set store.json.reader.allow_nan_inf = true;
--@test
select distinct t.Label, tt.Label from `jsonNanInf/PN_Inf_NaN.json` t
join `jsonNanInf/PN_Inf_NaN.json` tt
on t.Positive_Infinity = tt.Positive_Infinity
and t.Negative_Infinity = tt.Negative_Infinity;
reset store.json.reader.allow_nan_inf;
