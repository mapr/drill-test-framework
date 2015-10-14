select str_var_null_empty, sum(tinyint_var) from widestrings  where length(str_empty) > 0 and tinyint_var < -100 group by str_var_null_empty;
