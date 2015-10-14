select count(*) from j2 where c_bigint not in ( select c_bigint from j1) ;
