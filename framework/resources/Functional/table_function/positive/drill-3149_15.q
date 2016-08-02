select columns[0],columns[1],columns[2] from table(`table_function/lf_cr.tsv`(type=>'text', lineDelimiter=>'\u000a\u000d',fieldDelimiter=>'\u0009'));
