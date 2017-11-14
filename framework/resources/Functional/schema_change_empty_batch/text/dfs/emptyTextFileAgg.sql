set `planner.slice_target`=1;
select columns[1], count(*) from `psv/partsupp` group by columns[1] order by columns[1] limit 5;
reset `planner.slice_target`;
