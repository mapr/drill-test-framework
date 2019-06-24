set `exec.storage.enable_v3_text_reader` = true;
select * from `/drill/testdata/text_storage/v3_text_reader/region_malformed.csvh`;
reset `exec.storage.enable_v3_text_reader`;