select d.id, flatten(d.evnts) from dfs_test.`/drill/testdata/json_kvgenflatten/empty-null-map.json` d;
