select sub.json_val.id, flatten(sub.json_val.data) from (select convert_from(columns[0], 'JSON') json_val from `json_kvgenflatten/convert1.tbl`) sub;
