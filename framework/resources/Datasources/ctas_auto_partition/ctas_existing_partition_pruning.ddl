create table `existing_partition_pruning/lineitempart` partition by (dir0) as select * from dfs.`/drill/testdata/partition_pruning/dfs/lineitempart`;
create table `existing_partition_pruning/lineitem` partition by (dir0) as select * from dfs.`/drill/testdata/partition_pruning/dfs/lineitem`;
create table `existing_partition_pruning/lineitem_hierarchical_intstring` partition by (dir0, dir1) as select * from dfs.`/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring`;
create table `existing_partition_pruning/ordersjson` partition by (dir0) as select * from dfs.`/drill/testdata/partition_pruning/dfs/ordersjson`;
create table `existing_partition_pruning/orders` partition by (dir0) as select * from dfs.`/drill/testdata/partition_pruning/dfs/orders`;
