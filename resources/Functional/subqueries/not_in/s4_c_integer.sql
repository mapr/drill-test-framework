select count(*) from j1 where c_integer not in ( select c_integer from j5) ;
