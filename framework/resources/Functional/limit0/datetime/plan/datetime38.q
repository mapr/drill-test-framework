explain plan for select * from ( select extract(month from interval '1-2' year to month) from basic limit 1 ) t limit 0;
