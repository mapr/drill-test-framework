DROP TABLE IF EXISTS DRILL_5941_lines_count_skip_header_footer_one_line;

CREATE EXTERNAL TABLE `DRILL_5941_lines_count_skip_header_footer_one_line`(`header_1` string, `header_2` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION 'maprfs:/drill/testdata/hive_storage/DRILL_5941_lines_count_skip_header_footer_big_data_set'
TBLPROPERTIES ('skip.header.line.count'='1', 'skip.footer.line.count'='1');

DROP TABLE IF EXISTS DRILL_5941_lines_count_skip_header_footer_multiple_lines;

CREATE EXTERNAL TABLE `DRILL_5941_lines_count_skip_header_footer_multiple_lines`(`header_1` string, `header_2` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION 'maprfs:/drill/testdata/hive_storage/DRILL_5941_lines_count_skip_header_footer_big_data_set'
TBLPROPERTIES ('skip.header.line.count'='1990000', 'skip.footer.line.count'='1');

DROP TABLE IF EXISTS DRILL_5941_lines_count_skip_header_footer_more_lines_than_available;

CREATE EXTERNAL TABLE `DRILL_5941_lines_count_skip_header_footer_more_lines_than_available`(`header_1` string, `header_2` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION 'maprfs:/drill/testdata/hive_storage/DRILL_5941_lines_count_skip_header_footer_big_data_set'
TBLPROPERTIES ('skip.header.line.count'='3000000', 'skip.footer.line.count'='1');