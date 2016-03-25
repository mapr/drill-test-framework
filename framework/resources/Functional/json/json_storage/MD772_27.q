alter session set `store.json.all_text_mode`=true;
SELECT C1 FROM (SELECT * FROM `json_storage/tooManyNulls.json` WHERE c1 IS NOT NULL);
alter session set `store.json.all_text_mode`=false;
