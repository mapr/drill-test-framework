alter session set `store.json.all_text_mode`=true;
SELECT c1 FROM `json_storage/tooManyNulls.json` WHERE c1 ='Hello World';
alter session set `store.json.all_text_mode`=false;
