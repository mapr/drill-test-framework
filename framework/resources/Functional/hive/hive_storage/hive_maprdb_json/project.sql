set store.hive.maprdb_json.optimize_scan_with_native_reader = true;
select id, column_3, column_4 from hive.`json_MapR_DB_table` where column_1 = 'value_1_6';
reset store.hive.maprdb_json.optimize_scan_with_native_reader;