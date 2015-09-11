select name,state,city,`review_count` from `json_kvgenflatten/yelp_academic_dataset_business.json` where true=repeated_contains(categories,'Restaurants') order by `review_count` desc;
