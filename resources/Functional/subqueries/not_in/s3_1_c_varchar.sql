select count(*) from j2 where c_varchar not in ( select c_varchar from j3) ;
