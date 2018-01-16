select columns[0],columns[1],columns[2] from table(`table_function/lf_cr.tsv`(type=>'text', lineDelimiter=>'\n\r', fieldDelimiter=>'\t'));
