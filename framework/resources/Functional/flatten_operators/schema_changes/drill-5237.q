select count(*) as col from (select t1.a.a1 from (select t.*, flatten(t.b) as b from `drill-5237` t where t.c is not null) t1 where t1.a.a1 like 'a1')
