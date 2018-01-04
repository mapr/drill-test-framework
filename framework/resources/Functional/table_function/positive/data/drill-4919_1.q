select count(*) from table(`table_function/header.csv`(type=>'text',lineDelimiter=>'\r\n',fieldDelimiter=>',',extractHeader=>true));
