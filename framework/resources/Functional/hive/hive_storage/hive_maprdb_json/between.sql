set store.hive.maprdb_json.optimize_scan_with_native_reader = true;
select * from hive.`json_MapR_DB_table` where column_3 between 1 and 2;
reset store.hive.maprdb_json.optimize_scan_with_native_reader;