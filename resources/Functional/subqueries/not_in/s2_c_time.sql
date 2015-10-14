select count(*) from j2 where c_time not in ( select c_time from j1) ;
