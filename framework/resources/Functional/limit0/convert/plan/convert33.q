explain plan for select * from (
select cast(convert_to(types[1].minor[0].valueHolder, 'JSON') as varchar(40)) from `vvtypes.json`) t limit 0;
