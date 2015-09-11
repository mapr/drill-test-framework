select geo.features[0].location.bldgs, kvgen(geo.features[0].location.bldgs) from `json_kvgenflatten/nested.json` geo;
