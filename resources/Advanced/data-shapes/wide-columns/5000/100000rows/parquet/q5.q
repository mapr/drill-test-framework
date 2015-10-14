select str_empty_null, sum(tinyint_var) from widestrings  where length(str_empty) > 0 and length(str_var_null_empty) < 4010 group by str_empty_null;
