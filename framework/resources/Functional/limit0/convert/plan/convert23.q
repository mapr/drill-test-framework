explain plan for select * from (
select cast(convert_to(tbl.x.y, 'JSON') as varchar(20)) from `input2.json` tbl) t limit 0;
