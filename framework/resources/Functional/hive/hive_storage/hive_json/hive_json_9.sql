select get_json_object(hive_json.json, '$.User.Orders.ItemId[1]'), count(*) from hive_json group by get_json_object(hive_json.json, '$.User.Orders.ItemId[1]') order by count(*);
