create or replace view `dfs_test.window_functions`.smlTbl_v as select cast(col_int as int) col_int,cast(col_bgint as bigint) col_bgint,cast(col_char_2 as char(2)) col_char_2,cast(col_vchar_52 as varchar(52)) col_vchar_52,cast(col_tmstmp as timestamp) col_tmstmp, cast(col_dt as date) col_dt, cast(col_booln as boolean), cast(col_dbl as double) col_dbl, cast(col_tm as time) col_tm from `dfs_test.window_functions`.`smlTbl.parquet`;

create or replace view `dfs_test.window_functions`.tblWnulls_v as select cast(c1 as integer) c1, cast(c2 as char(1)) c2 from `dfs_test.window_functions`.`tblWnulls.parquet`;

create or replace view `dfs_test.window_functions`.allTypsUniq_v as select cast(col0 as int) col0,cast(col1 as bigint) col1,cast(col2 as float) col2,cast(col3 as double) col3,cast(col4 as time) col4,cast(col5 as timestamp) col5,cast(col6 as date) col6,cast(col7 as boolean) col7,cast(col8 as char(2)) col8,cast(col9 as character varying(52)) col9 from `dfs_test.window_functions`.`allTypsUniq.parquet`;

create or replace view `dfs_test.window_functions`.fewRowsAllData_v as select cast(col0 as int) col0,cast(col1 as bigint) col1,cast(col2 as char(2)) col2,cast(col3 as varchar(52)) col3,cast(col4 as timestamp) col4,cast(col5 as date) col5,cast(col6 as boolean) col6,cast(col7 as double) col7,cast(col8 as time) col8 from `dfs_test.window_functions`.`fewRowsAllData.parquet`;
