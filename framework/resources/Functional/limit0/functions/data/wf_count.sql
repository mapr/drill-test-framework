select count(*) over(partition by c_date order by c_date, c_integer) from optional_type_v;
