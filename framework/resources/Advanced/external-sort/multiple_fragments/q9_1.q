ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.width.max_per_node` = 10;
alter session set `planner.width.max_per_query` = 50;
select count(*) from (select columns[433] col433, columns[0], columns[1],columns[2],columns[3],columns[4],columns[5],columns[6],columns[7],columns[8],columns[9],columns[10],columns[11] from dfs.`/drill/testdata/resource-manager/3500cols.tbl` order by columns[450],columns[330],columns[230],columns[220],columns[110],columns[90],columns[80],columns[70],columns[40],columns[10],columns[20],columns[30],columns[40],columns[50], columns[454],columns[413],columns[940],columns[834],columns[73],columns[140],columns[104],columns[201],columns[304],columns[420],columns[520], columns[3410] ) d where d.col433 = 'sjka skjf';
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.width.max_per_query` = 1000;
alter session set `planner.width.max_per_node` = 17;
