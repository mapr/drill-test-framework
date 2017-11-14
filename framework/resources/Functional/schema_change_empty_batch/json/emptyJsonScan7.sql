set `planner.slice_target`=1;
select age, count(*) from `json/empty` group by age;
reset `planner.slice_target`;
