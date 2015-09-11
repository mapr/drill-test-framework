select count(*) from j1 where c_double not in ( select c_double from j5) ;
