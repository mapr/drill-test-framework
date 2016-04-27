select cast(c_row as int), cast(c_bigint as bigint) c_bigint, convert_from(convert_to(c_bigint, 'BIGINT_HADOOPV'), 'BIGINT_HADOOPV') from data;
