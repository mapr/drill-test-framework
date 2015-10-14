select * from widestrings where length(str_var_null_empty) > 4995  order by length(str_var), length(str_var_null_empty);
