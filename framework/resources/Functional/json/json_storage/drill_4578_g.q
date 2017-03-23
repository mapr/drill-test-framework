select * from (select t.children from `json_storage/employee.json` t) subq WHERE subq.children is not null;
