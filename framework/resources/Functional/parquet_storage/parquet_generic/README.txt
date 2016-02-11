CTAS statement used to create parquet file used in test drill4349.q is,

CREATE TABLE drill4349 
AS SELECT CAST(columns[0] AS INT) AS id, CAST(NULLIF(columns[1], '') AS DOUBLE) AS val 
from `manyNullsInColum.csv`;

CSV file manyNullsInColum.csv is placed under Datasources/parquet_storage/
This CSV file has over 30K nulls in column val in the parquet file.
