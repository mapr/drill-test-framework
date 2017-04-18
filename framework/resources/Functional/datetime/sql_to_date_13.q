select date_add(sql_to_date('02/28/2017', 'MM/DD/YYYY'), interval '1-3' year to month), date_add(sql_to_date('02/28/2017', 'MM/DD/YYYY'), interval '2' day) from (values(1));
