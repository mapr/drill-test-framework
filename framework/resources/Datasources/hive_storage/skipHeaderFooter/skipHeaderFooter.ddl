drop table if exists testheaderfooter;
create table testheaderfooter(voter_id int, name string, age int, contributions float, create_time string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' tblproperties("skip.header.line.count"="2","skip.footer.line.count"="1");

LOAD DATA LOCAL INPATH 'framework/resources/Datasources/hive_storage/skipHeaderFooter/headerFooter.tsv' OVERWRITE INTO TABLE testheaderfooter;

drop table if exists testheader;
create table testheader(voter_id int, name string, age int, contributions float, create_time string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' tblproperties("skip.header.line.count"="2");

LOAD DATA LOCAL INPATH 'framework/resources/Datasources/hive_storage/skipHeaderFooter/header.tsv' OVERWRITE INTO TABLE testheader;

drop table if exists testfooter;
create table testfooter(voter_id int, name string, age int, contributions float, create_time string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' tblproperties("skip.footer.line.count"="1");

LOAD DATA LOCAL INPATH 'framework/resources/Datasources/hive_storage/skipHeaderFooter/footer.tsv' OVERWRITE INTO TABLE testfooter;
