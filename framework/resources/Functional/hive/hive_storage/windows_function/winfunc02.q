select voter_id,registration,contributions,sum(contributions) over(partition by registration) as total from voter_hive;
