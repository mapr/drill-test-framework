select date_part('year', sql_to_date(c_date, 'YYYY-mm-dd')), date_part('month', sql_to_date(c_date, 'YYYY-mm-dd')), date_part('day', sql_to_date(c_date, 'YYYY-mm-dd')) from basic;
