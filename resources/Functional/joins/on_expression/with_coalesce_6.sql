select COALESCE(j1.c_integer, j3.c_integer, 100) from j1, j3 where j1.c_integer = j3.c_integer order by COALESCE(j1.c_integer, j3.c_integer, 100);
