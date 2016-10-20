select name,repeated_count(categories) as categorycount, categories from business where true=repeated_contains(categories,'Restaurants') order by name, repeated_count(categories) desc limit 10;
