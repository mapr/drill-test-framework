select distinct(celltbl.catl) from (
       select flatten(categories) catl from `json_kvgenflatten/yelp_academic_dataset_business.json` b
)  celltbl;
