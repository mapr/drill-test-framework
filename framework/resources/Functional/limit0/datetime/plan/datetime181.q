explain plan for select * from ( select interval '2 10:20:30' day to second + interval '13:40:35' hour to second from basic where c_row=1 ) t limit 0;
