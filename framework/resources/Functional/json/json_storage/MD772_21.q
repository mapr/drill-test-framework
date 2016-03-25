alter session set `store.json.all_text_mode`=true;
SELECT t.c5 FROM `json_storage/f_20160316.json` t WHERE t.c5 ='Hello World!';
alter session set `store.json.all_text_mode`=false;
