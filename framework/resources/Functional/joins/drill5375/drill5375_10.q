set `planner.enable_nljoin_for_scalar_only`=false;
select v.voter_id,s.name,v.contributions,s.registered_date,s.age from voter v left outer join student s on v.registered_date <> s.registered_date and (v.contributions <= 160.00 or s.age > 60);
reset `planner.enable_nljoin_for_scalar_only`;
