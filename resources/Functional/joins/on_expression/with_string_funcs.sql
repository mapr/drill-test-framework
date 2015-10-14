select
        UPPER(j1.c_varchar || 'abc'), regexp_replace(j2.c_varchar, '$', 'abc')
from
        j1 INNER JOIN j2
        ON (
           j1.c_integer = j2.c_integer
           AND UPPER(j1.c_varchar || 'abc') <> regexp_replace(j2.c_varchar, '$', 'abc')
           )
order by 1, 2 desc nulls first
limit 5
