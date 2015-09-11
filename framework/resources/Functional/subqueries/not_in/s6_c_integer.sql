select count(*) from j7 where c_integer not in ( select c_integer from j1) ;
