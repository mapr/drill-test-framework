select state, city, count(*) totalreviews from `json_kvgenflatten/yelp_academic_dataset_business.json` group by state, city order by count(*) desc;
