drop table if exists `dfs.drillTestDir`.table_3;
create table `dfs.drillTestDir`.table_3 as SELECT * FROM cp.`employee.json` LIMIT 2;
--@test
SELECT employee_id FROM `dfs.drillTestDir`.table_3 LIMIT 1;
