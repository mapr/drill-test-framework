explain plan for select * from (
select max(cast(twocf['age'] as integer)) from voter) t limit 0;
