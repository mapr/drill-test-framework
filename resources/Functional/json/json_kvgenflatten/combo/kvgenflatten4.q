select sub.rownum, flatten(sub.kvgen_output) from (select rownum, kvgen(flatten(complex)) kvgen_output from `json_kvgenflatten/kvgen1.json`) sub;
