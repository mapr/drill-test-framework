select count(*) from j7 where c_float not in ( select c_float from j1) ;
