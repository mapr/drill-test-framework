select count(*) from j2 where c_boolean not in ( select c_boolean from j3) ;
