ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.width.max_per_node` = 5;
alter session set `planner.width.max_per_query` = 50;
select * from (select columns[433] col433, columns[0], columns[1],columns[2],columns[3],columns[4],columns[5],columns[6],columns[7],columns[8],columns[9],columns[10],columns[11] from dfs.`/drill/testdata/resource-manager/3500cols.tbl` order by columns[450],columns[330],columns[230],columns[220],columns[110],columns[90],columns[80],columns[70],columns[40],columns[10],columns[20],columns[30],columns[40],columns[50], columns[454],columns[413],columns[940],columns[834],columns[73],columns[140],columns[104],columns[2222],columns[30],columns[2420],columns[1520], columns[1410], columns[1110],columns[1290],columns[2380],columns[705],columns[45],columns[1054],columns[2430],columns[420],columns[404],columns[3350], columns[3333],columns[153],columns[356],columns[84],columns[745],columns[1450],columns[103],columns[2065],columns[343],columns[3420],columns[530], columns[3210] ) d where d.col433 = 'sjka skjf';
alter session set `planner.width.max_per_query` = 1000;
alter session set `planner.width.max_per_node` = 5;
ALTER SESSION SET `exec.sort.disable_managed` = true;
