CREATE DATABASE IF NOT EXISTS IS;
USE IS;
DROP TABLE IF EXISTS HIVESTUDENTS;
CREATE EXTERNAL TABLE HIVESTUDENTS
(
    ID VARCHAR(24),
    NAME VARCHAR(24),
    STREET VARCHAR(256),
    ZIPCODE INT,
    STATE VARCHAR(20),
    PERCENTAGE DECIMAL
)
ROW FORMAT DELIMITED FIELDS
TERMINATED BY ','
STORED AS TEXTFILE LOCATION "/drill/testdata/information-schema/students/";

DROP TABLE IF EXISTS rankings;
CREATE EXTERNAL TABLE rankings (
pageRank INT,
pageURL STRING,
avgDuration INT
)
ROW FORMAT DELIMITED FIELDS
TERMINATED BY '|'
STORED AS TEXTFILE LOCATION "/drill/testdata/views/hive/rankings/";
CREATE OR REPLACE VIEW hive_rankings_view AS SELECT * FROM RANKINGS;

CREATE DATABASE IF NOT EXISTS MARKETING;
USE MARKETING;
CREATE TABLE IF NOT EXISTS MKT1 (COL1 STRING);
