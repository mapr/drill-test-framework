set `planner.enable_nljoin_for_scalar_only`=false;
select v1.name, v2.registration, v1.registered_date from voter v1 left join voter v2 on v2.registration not similar to '%(dem|pub|pen|lib)%' order by v2.registration,v1.name,v1.registered_date;
reset `planner.enable_nljoin_for_scalar_only`;
