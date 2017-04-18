select c_row, extract(day from sql_to_date(c_date,'YYYY-mm-dd')) from basic;
