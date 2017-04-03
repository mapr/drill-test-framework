SELECT count(*) from (select FLATTEN(t.a.b.c) AS c from `json_storage/empty_array.json` t) flat WHERE flat.c.d.e = 'f';
