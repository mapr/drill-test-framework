select
        concat('12345', o.c_varchar),
        concat(r.c_varchar, '12345'),
        concat('abcde', r.c_varchar),
        concat(r.c_varchar, 'abcde'),
        concat('', r.c_varchar),
        concat(r.c_varchar, '')
from
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date
order by
        1,2,3,4,5,6;
