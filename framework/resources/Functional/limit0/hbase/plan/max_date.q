explain plan for select * from (
select max(cast(fourcf['create_date'] as timestamp)) from voter) t limit 0;
