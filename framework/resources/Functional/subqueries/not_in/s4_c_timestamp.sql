select count(*) from j1 where c_timestamp not in ( select c_timestamp from j5) ;
