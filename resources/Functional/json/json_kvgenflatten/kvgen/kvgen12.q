select kvgen(bldgs[0]) from (select kvgen(geo.features[0].location.bldgs) bldgs from `json_kvgenflatten/nested.json` geo);
