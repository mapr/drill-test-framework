SELECT xpath_double ('<a><b>2000000000</b><c>40000000000</c></a>', 'a/b * a/c') from `fewtypes_null.tbl` limit 1;
