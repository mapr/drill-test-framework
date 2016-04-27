explain plan for select * from (
select min(c_integer) over() from optional_type_v) t limit 0;
