select c_row, extract(Year from sql_to_date(c_date,'YYYY-mm-dd')) from basic;
