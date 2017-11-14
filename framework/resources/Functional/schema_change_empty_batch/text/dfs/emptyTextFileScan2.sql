set `planner.slice_target`=1;
select * from `psv/part` order by columns[1] limit 5;
reset `planner.slice_target`;
