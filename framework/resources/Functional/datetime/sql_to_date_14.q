select date_add(sql_to_date(c_date, 'YYYY-mm-dd'), 10), date_add(sql_to_date(c_date, 'YYYY-mm-dd'), interval '10-4' year to month) from basic where c_row=1;
