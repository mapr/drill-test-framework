select count(*) from j2 where c_timestamp not in ( select c_timestamp from j3) ;
