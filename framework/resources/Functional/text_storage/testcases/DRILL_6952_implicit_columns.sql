set `exec.storage.min_width` = 2;
select *, drillTypeOf(dir0), drillTypeOf(dir1) from dfs.`/drill/testdata/text_storage/v3_text_reader/region_partitioned`;
reset `exec.storage.min_width`;