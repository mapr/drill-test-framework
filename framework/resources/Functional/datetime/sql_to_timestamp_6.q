select c_row,date_add(sql_to_timestamp(c_timestamp,'YYYY-mm-dd HH24:MI:SS'), interval '2' hour) from basic where c_row=1;
