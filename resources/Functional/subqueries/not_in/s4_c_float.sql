select count(*) from j1 where c_float not in ( select c_float from j5) ;
