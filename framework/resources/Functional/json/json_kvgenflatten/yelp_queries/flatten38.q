select celltbl.catl from (
       select flatten(categories) catl from `json_kvgenflatten/yelp_academic_dataset_business.json` b limit 100
)  celltbl where celltbl.catl = 'Doctors';
