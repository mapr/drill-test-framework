explain plan for select * from (
select sum(c_integer) over() from optional_type_v) t limit 0;
