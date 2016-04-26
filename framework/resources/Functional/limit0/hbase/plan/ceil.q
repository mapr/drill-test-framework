explain plan for select * from (
select ceil(cast(threecf['contributions'] as double)) age from voter where row_key=10) t limit 0;
