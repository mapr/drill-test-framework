select sub.str_empty from (select str_var_null_empty, str_empty from widestrings order by tinyint_var) sub  where length(sub.str_var_null_empty) > 4995 order by lower(sub.str_var_null_empty);
