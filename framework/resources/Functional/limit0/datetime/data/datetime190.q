select max(cast(c_time as time)) as col1 from basic group by cast(c_time as time) + interval '2:30:45.100' hour to second order by col1;
