select count(*) from j7 where c_double not in ( select c_double from j1) ;
