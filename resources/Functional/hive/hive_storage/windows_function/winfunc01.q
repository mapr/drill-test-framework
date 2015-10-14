select registration, age, name, sum(contributions) over(partition by registration order by age nulls first) from voter_hive order by registration nulls first, age nulls first, name nulls first;
