select * from hive_json where to_date(get_json_object(hive_json.json, '$.User.Orders.OrderDate[0]'),'MM/dd/YYYY') > to_date('04/01/2012','MM/dd/YYYY');
