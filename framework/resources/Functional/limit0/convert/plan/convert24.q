explain plan for select * from (
select cast(convert_to(`float`, 'JSON') as varchar(20)) from `input2.json`) t limit 0;
