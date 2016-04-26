explain plan for select * from ( select max(cast(c_timestamp as timestamp) + interval '1 2:30:45.100' day to second) from basic ) t limit 0;
