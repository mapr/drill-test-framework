select * from hive_json where get_json_object(hive_json.json, '$.User.ShippingAddress.City') like '%an%';
