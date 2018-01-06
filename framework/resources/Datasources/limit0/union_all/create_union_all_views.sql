create or replace view `dfs_test.union_all`.prqUnAll_0_v as select cast(col_int as int) col_int,cast(col_bgint as bigint) col_bgint,cast(col_char as char(8)) col_char,cast(col_vchar as varchar(16)) col_vchar,cast(col_tmstmp as timestamp) col_tmstmp,cast(col_date as date) col_date,cast(col_boln as boolean) col_boln,cast(col_dbl as double) col_dbl from `dfs_test.union_all`.`prqUnAll_0.parquet`;

create or replace view `dfs_test.union_all`.prqUnAll_1_v as select cast(col_int as int) col_int,cast(col_bgint as bigint) col_bgint,cast(col_char as char(8)) col_char,cast(col_vchar as varchar(16)) col_vchar,cast(col_tmstmp as timestamp) col_tmstmp,cast(col_date as date) col_date,cast(col_boln as boolean) col_boln,cast(col_dbl as double) col_dbl from `dfs_test.union_all`.`prqUnAll_1.parquet`;

create or replace view `dfs_test.union_all`.notEmpty_csv_v as select cast(columns[0] as int) col1,cast(columns[1] as character varying(15)) col2, cast(columns[2] as varchar(7)) col3 from `dfs_test.union_all`.`notEmptyFolder/notEmpty.csv`;

create or replace view `dfs_test.union_all`.empty_1_csv_v as select cast(columns[0] as int) key from `dfs_test.union_all`.`emptyFiles/empty_1.csv`;

create or replace view `dfs_test.union_all`.empty_1_json_v as select cast(key as int) key from `dfs_test.union_all`.`emptyFiles/empty_1.json`;
