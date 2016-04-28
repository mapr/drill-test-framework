explain plan for select * from ( select c_date, c_integer, count(c_integer) over() from j7_v order by 1, 2, 3 ) t limit 0;
