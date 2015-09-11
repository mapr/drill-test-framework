select ws2.str_null, max(ws1.tinyint_var) from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_null=ws2.str_var_null_empty group by ws2.str_null order by lower(ws2.str_null) limit 100;
