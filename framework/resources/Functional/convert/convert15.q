select c_row, cast(c_date as date), convert_from(convert_to(c_date, 'DATE_EPOCH'), 'DATE_EPOCH') from data where c_row < 23;
