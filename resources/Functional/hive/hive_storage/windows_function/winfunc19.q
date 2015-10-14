select voter_id, cume_dist() over(order by name nulls first) as CD,name from voter_hive order by voter_id nulls first, name nulls first;
