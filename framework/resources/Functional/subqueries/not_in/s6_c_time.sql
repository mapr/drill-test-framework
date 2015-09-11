select count(*) from j7 where c_time not in ( select c_time from j1) ;
