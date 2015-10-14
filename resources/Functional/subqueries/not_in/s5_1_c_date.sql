select count(*) from j6 where c_date not in ( select c_date from j1) ;
