alter session set `store.json.all_text_mode`=true;
SELECT c1 FROM ( SELECT * FROM `json_storage/tooManyNulls.json` WHERE c1 IS NOT NULL ) subquery;
alter session set `store.json.all_text_mode`=false;
