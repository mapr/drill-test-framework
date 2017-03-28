select d.id, flatten(d.evnts) from dfs.`/drill/testdata/json_kvgenflatten/empty-null-map.json` d;
