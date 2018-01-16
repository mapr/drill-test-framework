select avg(cast(columns[3] as float)) from table(`table_function/colons.txt`(type=>'text',lineDelimiter=>':::',fieldDelimiter=>'\\')) where cast(columns[0] as int) < 4;
