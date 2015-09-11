select count(*) from j7 where c_date not in ( select c_date from j1) ;
