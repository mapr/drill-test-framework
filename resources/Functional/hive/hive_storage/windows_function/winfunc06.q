select registration, age, max(contributions) over(partition by registration order by age nulls first) from voter_hive;
