alter session set `planner.enable_hashagg` = false;
alter session set `planner.enable_streamagg` = true;

select distinct sq.x1, sq.x2, sq.x3 from ( select cast(a1 as int), cast(b1 as char(5)), cast(c1 as date) from t1 union all select cast(a2 as int), cast(b2 as char(5)), cast(c2 as date) from t2 ) as sq(x1,x2,x3) order by 1, 2, 3;

alter session set `planner.enable_hashagg` = true;
alter session set `planner.enable_streamagg` = true;
