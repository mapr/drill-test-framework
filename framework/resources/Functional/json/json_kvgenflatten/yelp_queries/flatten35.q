select celltbl.catl, count(celltbl.catl) from (
       select business_id, flatten(categories) catl from `json_kvgenflatten/yelp_academic_dataset_business.json` b limit 100
)  celltbl group by celltbl.catl limit 10 ;
