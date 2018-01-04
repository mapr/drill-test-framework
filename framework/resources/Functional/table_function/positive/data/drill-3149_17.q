select columns[0],columns[1] from table(`table_function/formfeed.txt`(type=>'text', lineDelimiter=>'\f',fieldDelimiter=>',')) where columns[1] like '%b%';
