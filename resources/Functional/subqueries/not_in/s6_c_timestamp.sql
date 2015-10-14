select count(*) from j7 where c_timestamp not in ( select c_timestamp from j1) ;
