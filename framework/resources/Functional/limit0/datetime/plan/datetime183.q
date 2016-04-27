explain plan for select * from ( select interval '2 10:20:30' day to second + interval '13:40' hour to minute from basic where c_row=1 ) t limit 0;
