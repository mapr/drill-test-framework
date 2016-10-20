select name, state, city, `review_count` from business where true=repeated_contains(categories,'Restaurants') order by name, state, city, `review_count` desc limit 10;
