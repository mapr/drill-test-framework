explain plan for select * from (
select stddev(cast(twocf['age'] as integer)) from voter where twocf['age'] > 30) t limit 0;
