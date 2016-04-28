explain plan for select * from (
select sum(cast(threecf['contributions'] as double)) from voter) t limit 0;
