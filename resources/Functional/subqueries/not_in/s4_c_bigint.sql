select count(*) from j1 where c_bigint not in ( select c_bigint from j5) ;
