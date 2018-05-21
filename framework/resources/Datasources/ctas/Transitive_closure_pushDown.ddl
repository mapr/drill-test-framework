create table `transitive_closure/DRILL_6173_filterPushdown/tab1` (itm, y, m, category)
partition by (y, m, category) as
select cast(columns[1] as int) itm, cast(columns[2] as int) y, cast(columns[3] as int) m, cast(columns[4] as int) category from dfs.drillTestDir.`transitive_closure/filterPushdown/Transitive_closure.csv` where columns[0]='tab1';

create table `transitive_closure/DRILL_6173_filterPushdown/tab2` (itm, y, m, category)
partition by (y, m) as
select cast(columns[1] as int) itm, cast(columns[2] as int) y, cast(columns[3] as int) m, cast(columns[4] as int) category from dfs.drillTestDir.`transitive_closure/filterPushdown/Transitive_closure.csv` where columns[0]='tab2';

create table `transitive_closure/DRILL_6173_filterPushdown/tab3` (sub_category, category)
partition by (sub_category) as
select columns[1] sub_category, cast(columns[2] as int) category from dfs.drillTestDir.`transitive_closure/filterPushdown/Transitive_closure.csv` where columns[0]='tab3';
