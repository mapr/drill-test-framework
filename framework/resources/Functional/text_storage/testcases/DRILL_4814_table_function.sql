set `exec.storage.enable_v3_text_reader` = false;
select * from table(`/drill/testdata/text_storage/v3_text_reader/region_malformed.csvh`(type=>'text',lineDelimiter=>'\n',fieldDelimiter=>',',extractHeader=>true));
reset `exec.storage.enable_v3_text_reader`;