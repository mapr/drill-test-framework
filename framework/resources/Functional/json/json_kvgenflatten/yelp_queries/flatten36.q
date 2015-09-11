select celltbl.catl, count(celltbl.catl) from (
       select flatten(categories) catl from `json_kvgenflatten/yelp_academic_dataset_business.json` b
)  celltbl group by celltbl.catl order by celltbl.catl desc limit 10 ;
