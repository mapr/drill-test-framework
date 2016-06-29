drop table if exists emptyheaderfooter;
create table emptyheaderfooter(voter_id int, name string, age int, contributions float, create_time string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' tblproperties("skip.header.line.count"="","skip.footer.line.count"="");

LOAD DATA LOCAL INPATH 'framework/resources/Datasources/hive_storage/skipHeaderFooter/headerFooter.tsv' OVERWRITE INTO TABLE emptyheaderfooter;
