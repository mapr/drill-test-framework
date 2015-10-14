select c_integer, COUNT(DISTINCT c_integer) from alltypes group by c_integer order by c_integer;
