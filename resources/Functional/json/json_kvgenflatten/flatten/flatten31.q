select sub.id, max(sub.val) from (select id, flatten(ints)+1 val from `json_kvgenflatten/math-flatten.json`) sub group by sub.id;
