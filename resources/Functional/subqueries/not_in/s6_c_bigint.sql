select count(*) from j7 where c_bigint not in ( select c_bigint from j1) ;
