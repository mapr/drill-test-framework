DROP TABLE IF EXISTS dfs.drilltestdir.`employee_json_for_subq`;
CREATE TABLE dfs.drilltestdir.`employee_json_for_subq` as SELECT * FROM cp.`employee.json`;
