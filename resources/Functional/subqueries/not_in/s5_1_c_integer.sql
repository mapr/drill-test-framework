select count(*) from j6 where c_integer not in ( select c_integer from j1) ;
