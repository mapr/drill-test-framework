explain plan for select * from (select *, t1_v.*, sum(a1) over w, count(a1) over w from t1_v window w as (partition by b1 order by c1 desc)) limit 0;
