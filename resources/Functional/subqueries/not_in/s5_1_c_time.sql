select count(*) from j6 where c_time not in ( select c_time from j1) ;
