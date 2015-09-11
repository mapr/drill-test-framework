select char_length(bldgs[0].key), char_length(bldgs[0].`value`) from (select kvgen(geo.features[0].location.bldgs) bldgs from `json_kvgenflatten/nested.json` geo);
