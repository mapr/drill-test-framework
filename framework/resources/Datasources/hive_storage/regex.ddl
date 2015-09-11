CREATE EXTERNAL TABLE IF NOT EXISTS hive_storage.raw_access_log(
remote_host STRING,
remote_logname STRING,
remote_user STRING,
request_time STRING,
first_line STRING,
http_status STRING,
bytes STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
"input.regex" = "([^ ]*) ([^ ]*) ([^ ]*) (-|\\[[^\\]]*\\]) ([^ \"]*|\"[^\"]*\") (-|[0-9]*) (-|[0-9]*)",
"output.format.string" = "%1$s %2$s %3$s %4$s %5$s %6$s %7$s"
)
LOCATION '/drill/testdata/hive_storage/raw_access_log'
;
