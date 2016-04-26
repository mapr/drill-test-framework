explain plan for select * from ( select interval '2 10:20:30' day to second + interval '30' second from basic limit 1 ) t limit 0;
