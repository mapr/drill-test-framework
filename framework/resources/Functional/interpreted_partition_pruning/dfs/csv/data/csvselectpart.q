select columns[0],
columns[1],
columns[4],
columns[10],
columns[13]
from `/drill/testdata/partition_pruning/dfs/lineitempart` where dir0=1995-2;
