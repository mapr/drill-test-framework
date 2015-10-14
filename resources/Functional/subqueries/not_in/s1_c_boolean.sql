select count(*) from j1 where c_boolean not in ( select c_boolean from j2) ;
