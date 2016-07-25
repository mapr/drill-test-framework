select flatten(d.j.LIST) from (select convert_from(columns[0], 'JSON') j from `json_kvgenflatten/convert4783_1.tbl` where 1=2) d;
