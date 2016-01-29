-- join on int96 column
select
        count(t1.c_timestamp)
from
        imp_t1 t1
                inner join
        imp_t2 t2
on      (t1.c_timestamp = t2.c_timestamp)
;
