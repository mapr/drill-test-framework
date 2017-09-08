select t.partkey, t1.ps_partkey from `json/empty` as t LEFT JOIN `json/partsupp` as t1 ON t.partkey = t1.ps_partkey;
