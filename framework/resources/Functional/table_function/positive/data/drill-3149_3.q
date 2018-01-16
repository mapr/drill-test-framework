select columns[0],columns[1],columns[2] from table(`table_function/cr_lf.csv`(type=>'text', lineDelimiter=>'\r\n', fieldDelimiter=>',')) order by columns[2] limit 2;
