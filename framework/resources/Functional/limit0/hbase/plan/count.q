explain plan for select * from (
select count(distinct(cast(onecf['name'] as varchar(30)))) from voter) t limit 0;
