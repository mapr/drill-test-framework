select count(*) from j2 where c_float not in ( select c_float from j3) ;
