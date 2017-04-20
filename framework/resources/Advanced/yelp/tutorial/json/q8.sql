select count(*) as TotalRestaurants from business where true=repeated_contains(categories,'Restaurants');
