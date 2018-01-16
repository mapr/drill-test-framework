select columns[0],columns[1],columns[2] from table(`table_function/cr_only.txt`(type=>'text',lineDelimiter=>'\r',fieldDelimiter=>'\"'));
