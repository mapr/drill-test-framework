select max(columns[2]),min(columns[1]),sum(cast(columns[0] as int)) from table(`dfs_test.drillTestDir`.`table_function/cr_only.txt`(type=>'text',lineDelimiter=>'\r',fieldDelimiter=>'\"'));
