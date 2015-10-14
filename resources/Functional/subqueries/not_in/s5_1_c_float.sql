select count(*) from j6 where c_float not in ( select c_float from j1) ;
