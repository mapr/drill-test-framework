select count(*) from j6 where c_boolean not in ( select c_boolean from j1) ;
