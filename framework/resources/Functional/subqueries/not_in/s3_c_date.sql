select count(*) from j2 where c_date not in ( select c_date from j3) ;
