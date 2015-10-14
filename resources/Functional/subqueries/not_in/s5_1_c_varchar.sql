select count(*) from j6 where c_varchar not in ( select c_varchar from j1) ;
