select get_json_object(hive_json.json, '$.User.Orders.OrderPrice[0]')/2.0 from hive_json where get_json_object(hive_json.json, '$.User.Id')=1240;
