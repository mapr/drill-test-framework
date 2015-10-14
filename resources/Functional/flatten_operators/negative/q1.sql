-- DRILL-2181
select * from `data.json` order by flatten(events);
