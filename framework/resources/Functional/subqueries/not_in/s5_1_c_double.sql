select count(*) from j6 where c_double not in ( select c_double from j1) ;
