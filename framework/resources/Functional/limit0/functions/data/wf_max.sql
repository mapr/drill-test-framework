select max(c_bigint) over(partition by c_date) from optional_type_v;
