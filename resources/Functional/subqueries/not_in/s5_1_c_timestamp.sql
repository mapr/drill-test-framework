select count(*) from j6 where c_timestamp not in ( select c_timestamp from j1) ;
