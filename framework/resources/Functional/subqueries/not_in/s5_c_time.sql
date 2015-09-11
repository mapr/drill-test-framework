select count(*) from j1 where c_time not in ( select c_time from j6) ;
