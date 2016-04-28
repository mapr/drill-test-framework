select cast(c_row as int), cast(c_int as int), convert_from(convert_to(c_int, 'INT'), 'INT') from data;
