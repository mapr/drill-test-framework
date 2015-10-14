select sub.str_var from (select str_var from widestrings order by lower(str_null) asc) sub order by lower(sub.str_var) desc;
