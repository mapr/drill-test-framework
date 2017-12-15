set `planner.enable_nljoin_for_scalar_only`=false;
select v.voter_id,s.name,v.registered_date,s.age from voter v left join student s on v.registered_date <> s.registered_date or s.age <= v.age;
reset `planner.enable_nljoin_for_scalar_only`;
