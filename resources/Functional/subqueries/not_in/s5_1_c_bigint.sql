select count(*) from j6 where c_bigint not in ( select c_bigint from j1) ;
