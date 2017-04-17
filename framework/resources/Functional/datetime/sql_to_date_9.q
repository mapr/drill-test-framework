select c_row, extract(month from sql_to_date(c_date,'YYYY-mm-dd')) from basic;
