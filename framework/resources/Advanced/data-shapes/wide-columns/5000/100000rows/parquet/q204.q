select * from widestrings where length(str_var_null_empty) > 4995  order by length(str_empty_null), length(str_var_null_empty);
