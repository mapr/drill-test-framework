create table drill_3769 as select to_date(c3 + interval '1' day ) from ctas_t1 order by c3;
select * from drill_3769 order by 1;
drop table drill_3769;
