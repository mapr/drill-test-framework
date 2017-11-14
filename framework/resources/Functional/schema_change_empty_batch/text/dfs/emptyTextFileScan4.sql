set `planner.slice_target`=1;
select DISTINCT columns[1] from `psv/partsupp` order by columns[1] limit 5;
reset `planner.slice_target`;
