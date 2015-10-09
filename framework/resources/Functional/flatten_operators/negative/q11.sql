-- DRILL-2217
select flatten(empty[1][0]) from `data1.json` order by flatten(empty[1][0]);
