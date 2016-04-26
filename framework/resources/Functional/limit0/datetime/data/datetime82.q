select cast(c_row as int), cast(c_date as date), date_add(cast(c_date as date), 366) from basic;
