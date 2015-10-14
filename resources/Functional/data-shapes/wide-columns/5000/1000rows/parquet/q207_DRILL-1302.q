select sub.str_empty from (select str_var_null_empty, str_empty from widestrings order by tinyint_var) sub order by lower(sub.str_var_null_empty);
