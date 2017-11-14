set `planner.slice_target`=1;
select CONVERT_FROM(columns[1], 'JSON') as col1 from `psv/json_field`;
reset `planner.slice_target`;
