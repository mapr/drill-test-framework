select get_json_object(hive_json.json, '$.User.Id')/2.0 as col1 from hive_json order by col1;
