alter session set `store.json.all_text_mode`=true;
SELECT t.c4 FROM `json_storage/f_20160316.json` t WHERE t.c4 IS NOT NULL;
alter session set `store.json.all_text_mode`=false;
