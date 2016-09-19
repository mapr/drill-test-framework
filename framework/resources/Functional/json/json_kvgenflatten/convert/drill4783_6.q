select d.id, flatten(d.j.LIST) from (select convert_from(columns[0], 'JSON') j, columns[1] id from `json_kvgenflatten/convert4783_1.tbl`) d;
