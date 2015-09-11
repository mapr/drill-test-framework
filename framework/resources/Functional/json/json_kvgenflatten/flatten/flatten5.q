select uid, flatten(events), flatten(transactions) from `json_kvgenflatten/single-user-transactions.json`;
