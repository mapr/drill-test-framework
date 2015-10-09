-- DRILL-2182
select * from `data1.json` order by flatten(uid);
