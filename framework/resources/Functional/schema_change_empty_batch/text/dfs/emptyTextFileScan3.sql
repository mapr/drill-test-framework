set `planner.slice_target`=1;
select * from `psv/part` where columns[0] < 0;
reset `planner.slice_target`;
