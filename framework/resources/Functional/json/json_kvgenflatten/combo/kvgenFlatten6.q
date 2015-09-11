select flatten(sub.fk.`value`) from (select flatten(kvgen(map)) fk from `json_kvgenflatten/nested3.json`) sub;
