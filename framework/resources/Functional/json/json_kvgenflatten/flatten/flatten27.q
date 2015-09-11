select id, regexp_replace(flatten(strs), 'a','b') from `json_kvgenflatten/regex-flatten.json`;
