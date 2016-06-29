explain plan for select * from ( select cast(c_row as int), cast(c_time as varchar(50)), cast(c_time as time) + interval '21:30:54' hour to second from basic ) t limit 0;
