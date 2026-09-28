-- expected: from the data file; the "" key is dropped, a/b read normally (V2 reader, disabled by default in HPE distro)
alter session set `store.json.enable_v2_reader` = true;
--@test
select a, b from `drill-1.22-delta/json_empty_keys/empty_key.json`;
alter session reset `store.json.enable_v2_reader`
