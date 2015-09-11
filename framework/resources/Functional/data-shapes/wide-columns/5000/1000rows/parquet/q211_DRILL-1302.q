select sub.str_fixed from (select str_fixed from widestrings order by lower(str_null) asc) sub order by lower(sub.str_fixed) desc;
