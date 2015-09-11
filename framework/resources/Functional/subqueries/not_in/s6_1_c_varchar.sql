select count(*) from j1 where c_varchar not in ( select c_varchar from j7) ;
