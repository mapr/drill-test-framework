select name, count(voter_id) over(partition by registration), sum(contributions)  over(partition by registration) from voter_hive;
