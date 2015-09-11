select ws2.str_empty, max(ws1.tinyint_var) from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_empty=ws2.str_var_null_empty group by ws2.str_empty order by lower(ws2.str_empty) limit 100;
