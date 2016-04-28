explain plan for select * from (
select cast(voter.twocf.age as integer) - cast(row_key as int) from voter where row_key=10) t limit 0;
