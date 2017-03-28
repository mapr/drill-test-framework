select d.id, flatten(d.evnts) from dfs.`/drill/testdata/json_kvgenflatten/empty-array.json` d;
