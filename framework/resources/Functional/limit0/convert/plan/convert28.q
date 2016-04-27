explain plan for select * from (
select cast(convert_to(rl[0][1], 'SIMPLEJSON') as varchar(20)) from `input2.json`) t limit 0;
