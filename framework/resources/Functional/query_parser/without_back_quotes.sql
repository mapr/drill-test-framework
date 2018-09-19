drop table if exists dfs.drillTestDir.table_1;
create table dfs.drillTestDir.table_1 as SELECT * FROM cp.`employee.json` LIMIT 2;
--@test
SELECT employee_id FROM dfs.drillTestDir.table_1 LIMIT 1;
