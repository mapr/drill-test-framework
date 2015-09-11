with tmp as ( select flatten(data) as newdata from `json_kvgenflatten/DRILL-1766.json`) select kvgen(tmp.newdata.name) from tmp;
