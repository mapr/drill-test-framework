select cast(name as varchar(30)), cast(create_time as timestamp) create_time from student where create_time between '2015-02-12 02:15:45' and '2015-02-13 10:25:55';
