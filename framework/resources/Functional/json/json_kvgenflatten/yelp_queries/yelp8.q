select count(*) as TotalRestaurants from `json_kvgenflatten/yelp_academic_dataset_business.json` where true=repeated_contains(categories,'Restaurants');
