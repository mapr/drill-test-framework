alter session set `store.json.all_text_mode`=true;
SELECT t.c7 FROM `json_storage/f_20160316.json` t WHERE t.c7 ='1969-09-20';
alter session set `store.json.all_text_mode`=false;
