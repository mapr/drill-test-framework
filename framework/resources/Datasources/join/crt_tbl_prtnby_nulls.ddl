DROP TABLE IF EXISTS tbl_prtnby_all_nulls_chr_col;

CREATE TABLE tbl_prtnby_all_nulls_chr_col
PARTITION BY (c4) 
AS
SELECT
        CAST(columns[0] AS INTEGER) c1,
        CAST(columns[1] AS CHAR(2)) c2,
        CAST(columns[2] AS VARCHAR(65)) c3,
        CASE when columns[3] = '' THEN CAST(null AS char(1)) END c4,
        CAST(columns[4] AS DATE) c5
FROM `allNullsInCol.csv`;

DROP TABLE IF EXISTS tbl_prtnby_all_nulls_vrchr_col;

CREATE TABLE tbl_prtnby_all_nulls_vrchr_col
PARTITION BY (c4) 
AS
SELECT
        CAST(columns[0] AS INTEGER) c1,
        CAST(columns[1] AS CHAR(2)) c2,
        CAST(columns[2] AS VARCHAR(65)) c3,
        cASe when columns[3] = '' THEN CAST(null AS VARCHAR(2)) END c4,
        CAST(columns[4] AS DATE) c5
FROM `allNullsInCol.csv`;

DROP TABLE IF EXISTS tbl_prtnby_all_nulls_int_col;

CREATE TABLE tbl_prtnby_all_nulls_int_col
PARTITION BY (c4) 
AS
SELECT
        CAST(columns[0] AS INTEGER) c1,
        CAST(columns[1] AS CHAR(2)) c2,
        CAST(columns[2] AS VARCHAR(65)) c3,
        cASe when columns[3] = '' THEN CAST(null AS INTEGER) END c4,
        CAST(columns[4] AS DATE) c5
FROM `allNullsInCol.csv`;

DROP TABLE IF EXISTS tbl_prtnby_all_nulls_dbl_col;

CREATE TABLE tbl_prtnby_all_nulls_dbl_col
PARTITION BY (c4) 
AS
SELECT
        CAST(columns[0] AS INTEGER) c1,
        CAST(columns[1] AS CHAR(2)) c2,
        CAST(columns[2] AS VARCHAR(65)) c3,
        cASe when columns[3] = '' THEN CAST(null AS DOUBLE) END c4,
        CAST(columns[4] AS DATE) c5
FROM `allNullsInCol.csv`;

DROP TABLE IF EXISTS tbl_prtnby_all_nulls_date_col;

CREATE TABLE tbl_prtnby_all_nulls_date_col
PARTITION BY (c4) 
AS
SELECT
        CAST(columns[0] AS INTEGER) c1,
        CAST(columns[1] AS CHAR(2)) c2,
        CAST(columns[2] AS VARCHAR(65)) c3,
        cASe when columns[3] = '' THEN CAST(null AS DATE) END c4,
        CAST(columns[4] AS DATE) c5
FROM `allNullsInCol.csv`;

DROP TABLE IF EXISTS tbl_prtnby_all_nulls_time_col;

CREATE TABLE tbl_prtnby_all_nulls_time_col
PARTITION BY (c4) 
AS
SELECT
        CAST(columns[0] AS INTEGER) c1,
        CAST(columns[1] AS CHAR(2)) c2,
        CAST(columns[2] AS VARCHAR(65)) c3,
        cASe when columns[3] = '' THEN CAST(null AS TIME) END c4,
        CAST(columns[4] AS DATE) c5
FROM `allNullsInCol.csv`;

DROP TABLE IF EXISTS tbl_prtnby_all_nulls_tmstmp_col;

CREATE TABLE tbl_prtnby_all_nulls_tmstmp_col
PARTITION BY (c4) 
AS
SELECT
        CAST(columns[0] AS INTEGER) c1,
        CAST(columns[1] AS CHAR(2)) c2,
        CAST(columns[2] AS VARCHAR(65)) c3,
        cASe when columns[3] = '' THEN CAST(null AS TIMESTAMP) END c4,
        CAST(columns[4] AS DATE) c5
FROM `allNullsInCol.csv`;

DROP TABLE IF EXISTS tbl_prtnby_all_nulls_intrvlday_col;

CREATE TABLE tbl_prtnby_all_nulls_intrvlday_col
PARTITION BY (c4) 
AS
SELECT
        CAST(columns[0] AS INTEGER) c1,
        CAST(columns[1] AS CHAR(2)) c2,
        CAST(columns[2] AS VARCHAR(65)) c3,
        cASe when columns[3] = '' THEN CAST(null AS INTERVAL DAY) END c4,
        CAST(columns[4] AS DATE) c5
FROM `allNullsInCol.csv`;
