select name, count(voter_id) over(partition by registration,name) from voter_hive;
