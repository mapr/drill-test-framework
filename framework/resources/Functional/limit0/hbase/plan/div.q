explain plan for select * from (
select div(cast(voter.twocf.age as integer),cast(row_key as int)) div from voter where row_key < 11 order by div) t limit 0;
