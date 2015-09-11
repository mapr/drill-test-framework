select c_row, c_bigint, convert_from(convert_to(c_bigint, 'BIGINT'), 'BIGINT') from data;
