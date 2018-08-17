DROP TABLE IF EXISTS table_name;
CREATE EXTERNAL TABLE table_name (
  id string,
  column_1 string,
  column_2 int,
  column_3 int,
  column_4 boolean
)
STORED BY 'org.apache.hadoop.hive.maprdb.json.MapRDBJsonStorageHandler'
TBLPROPERTIES("maprdb.table.name" = "hadoop_folder/table_name","maprdb.column.id" = "id");