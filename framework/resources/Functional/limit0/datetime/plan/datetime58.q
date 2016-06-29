explain plan for select * from ( select extract(minute from cast(col1 as interval day)) from `interval.json` ) t limit 0;
