explain plan for select * from (
select avg(cast(threecf['contributions'] as float)) from voter) t limit 0;
