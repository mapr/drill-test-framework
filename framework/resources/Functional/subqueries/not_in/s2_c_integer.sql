select count(*) from j2 where c_integer not in ( select c_integer from j1) ;
