explain plan for select * from ( select extract (minute from interval '1 2:30:45.100' day to second) from basic limit 1 ) t limit 0;
