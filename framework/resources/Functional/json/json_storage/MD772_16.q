alter session set `store.json.all_text_mode`=true;
SELECT t.c9 FROM `json_storage/f_20160316.json` t WHERE t.c9 IS NOT NULL;
alter session set `store.json.all_text_mode`=false;
