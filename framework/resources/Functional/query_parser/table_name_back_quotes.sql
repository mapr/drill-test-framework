drop table if exists dfs.drillTestDir.`table_4`;
create table dfs.drillTestDir.`table_4` as SELECT * FROM cp.`employee.json` LIMIT 2;
--@test
SELECT employee_id FROM dfs.`/drill/testdata/table_4` LIMIT 1;
