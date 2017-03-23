select * from (select t.children from `json_storage/employee_wchildren.json` t) subq WHERE subq.children is not null;
