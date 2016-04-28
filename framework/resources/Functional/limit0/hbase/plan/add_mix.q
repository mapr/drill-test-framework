explain plan for select * from (
select cast(twocf['age'] as integer) + cast(threecf['contributions'] as double) from voter where row_key=10) t limit 0;
