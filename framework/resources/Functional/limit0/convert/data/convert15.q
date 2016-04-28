select cast(c_row as int) c_row, cast(c_date as date) c_date, convert_from(convert_to(c_date, 'DATE_EPOCH'), 'DATE_EPOCH') from data where c_row < 23;
