select categories[0], count(categories[0]) as categorycount from `json_kvgenflatten/yelp_academic_dataset_business.json` group by categories[0] order by count(categories[0]) desc;
