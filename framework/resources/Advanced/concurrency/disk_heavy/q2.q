select l_shipmode 
from dfs.concurrency.lineitem t1 
where length(l_shipmode) > length(l_comment);
