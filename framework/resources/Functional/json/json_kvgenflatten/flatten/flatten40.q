select cast(to_timestamp(a.executionTime,'YYYY-MM-DD hh:mm:ss a') as timestamp) as executionTime,
     cast(a.entries.id as int) as id, 
     cast(a.entries.stationName as varchar(50))  as stationName,
     cast(a.entries.availableDocks as int) as availableDocks,
     cast(a.entries.totalDocks as int) as totalDocks,
     cast(a.entries.latitude as float) as latitude,
     cast(a.entries.longitude as float) as longitude,
     a.entries.statusValue as statusValue,
     cast(a.entries.statusKey as int) as statusKey,
     cast(a.entries.availableBikes as int) as availableBikes,
     cast(a.entries.stAddress1 as varchar(50)) as stAddress1,
     cast(a.entries.testStation as boolean) as testStation
 from (select executionTime, flatten(stationBeanList) as entries FROM  `json_kvgenflatten/bike_station_data`) a;
