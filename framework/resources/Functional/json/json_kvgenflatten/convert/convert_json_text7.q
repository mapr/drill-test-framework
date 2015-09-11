select sub.json_val.a from (select flatten(convert_from(columns[1], 'JSON')) json_val from `json_kvgenflatten/convert4.tbl`) sub;
