select sub.str_var_null_empty from (select str_var_null_empty from widestrings order by lower(str_null) asc) sub order by lower(sub.str_var_null_empty) desc;
