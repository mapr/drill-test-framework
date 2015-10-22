create or replace view v_3781(a1, b1, c1) as select cast(a1 as integer), cast(b1 as varchar(10)), cast(c1 as date) from t1;

select count(*) from v_3781 group by CURRENT_DATE;

drop view v_3781;
