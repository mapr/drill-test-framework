select count(*) from j1 where c_date not in ( select c_date from j7) ;
