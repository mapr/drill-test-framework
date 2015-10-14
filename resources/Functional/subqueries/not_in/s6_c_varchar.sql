select count(*) from j7 where c_varchar not in ( select c_varchar from j1) ;
