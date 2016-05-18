select min(get_json_object(hive_json.json, '$.User.Id')), max(get_json_object(hive_json.json, '$.User.Id')),min(get_json_object(hive_json.json, '$.User.Name')),max(get_json_object(hive_json.json, '$.User.Name')),min(cast(get_json_object(hive_json.json, '$.User.Orders.OrderPrice[0]') as double)),min(cast(get_json_object(hive_json.json, '$.User.Orders.OrderPrice[1]') as float)),min(to_date(get_json_object(hive_json.json, '$.User.Orders.OrderDate[0]'),'MM/dd/YYYY')),max(cast(get_json_object(hive_json.json, '$.User.Orders.OrderPrice[0]') as float)),max(cast(get_json_object(hive_json.json, '$.User.Orders.OrderPrice[1]') as double)),max(to_date(get_json_object(hive_json.json, '$.User.Orders.OrderDate[0]'),'MM/dd/YYYY')) from hive_json;
