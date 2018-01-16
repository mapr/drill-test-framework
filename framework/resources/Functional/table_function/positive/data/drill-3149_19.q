select columns[0],columns[1],columns[2] from table(`table_function/header.csv`(type=>'text',lineDelimiter=>'\r\n',fieldDelimiter=>',',skipFirstLine=>true));
