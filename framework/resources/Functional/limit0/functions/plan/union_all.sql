explain plan for select * from (
select c_varchar from optional_type_v union all select c_varchar from required_type_v) t limit 0;
