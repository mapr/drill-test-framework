select count(*) from j2 where c_double not in ( select c_double from j1) ;
