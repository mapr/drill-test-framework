select sub.str_null from (select str_null from widestrings order by lower(str_null) asc) sub order by lower(sub.str_null) desc;
