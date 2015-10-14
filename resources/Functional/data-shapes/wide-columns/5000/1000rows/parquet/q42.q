select ws.*, sub.str_null str_null1 from widestrings ws INNER JOIN (select str_null, max(tinyint_var) max_ti from widestrings group by str_null) sub on ws.tinyint_var = sub.max_ti;
