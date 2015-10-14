select c_row, c_bigint, convert_from(convert_to(c_bigint, 'BIGINT_HADOOPV'), 'BIGINT_HADOOPV') from data;
