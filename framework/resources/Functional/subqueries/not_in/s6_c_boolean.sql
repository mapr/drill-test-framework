select count(*) from j7 where c_boolean not in ( select c_boolean from j1) ;
