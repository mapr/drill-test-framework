select sub.str_empty_null from (select str_empty_null from widestrings order by lower(str_null) asc) sub order by lower(sub.str_empty_null) desc;
