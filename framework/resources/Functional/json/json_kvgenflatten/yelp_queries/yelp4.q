select stars,trunc(avg(review_count)) reviewsavg from `json_kvgenflatten/yelp_academic_dataset_business.json` group by stars order by stars desc;
