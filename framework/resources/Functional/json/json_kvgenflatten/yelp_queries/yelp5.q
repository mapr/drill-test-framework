select name, state,city, `review_count` from `json_kvgenflatten/yelp_academic_dataset_business.json` where review_count > 1000 order by `review_count` desc;
