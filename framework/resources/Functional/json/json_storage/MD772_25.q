alter session set `store.json.all_text_mode`=true;
SELECT t.c9 FROM `json_storage/f_20160316.json` t WHERE t.c9 =0.34587465999;
alter session set `store.json.all_text_mode`=false;
