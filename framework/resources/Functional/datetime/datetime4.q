select c_row, cast(c_date as date), date_add(cast(c_date as date),-180) from basic;
