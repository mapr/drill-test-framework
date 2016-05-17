select cast((get_json_object(hive_json.json, '$.User.Orders.OrderPrice[0]')) as float) - cast((get_json_object(hive_json.json, '$.User.Orders.OrderPrice[1]')) as float) from hive_json;
