explain plan for select * from (
select col from ( select c_integer from optional_type_v union select c_bigint from required_type_v ) as foo(col) order by 1) t limit 0;
