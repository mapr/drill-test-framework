select cast(convert_to(bldgs[0], 'json') as varchar(64)) from (select kvgen(geo.features[0].location.bldgs) bldgs from `json_kvgenflatten/nested.json` geo);
