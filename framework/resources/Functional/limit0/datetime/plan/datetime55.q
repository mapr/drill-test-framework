explain plan for select * from ( select extract(month from cast(col1 as interval year)) from `interval.json` ) t limit 0;
