explain plan for select * from ( select c_integer, COUNT(DISTINCT c_integer) from alltypes_v group by c_integer order by c_integer ) t limit 0;
