explain plan for select * from ( select time '02:00:00' + interval '23:00:00' hour to second from basic limit 1 ) t limit 0;
