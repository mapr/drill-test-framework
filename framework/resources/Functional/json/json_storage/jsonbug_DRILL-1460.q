alter session set `store.json.read_numbers_as_double`=true;
select id from `json_storage/DRILL-1460.json`;
alter session set `store.json.read_numbers_as_double`=false;
