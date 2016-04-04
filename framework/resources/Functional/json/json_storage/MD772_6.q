alter session set `store.json.all_text_mode`=true;
SELECT c1 FROM ( SELECT * FROM `json_storage/tooManyNulls.json` ) subquery WHERE c1 IS NOT NULL;
alter session set `store.json.all_text_mode`=false;
