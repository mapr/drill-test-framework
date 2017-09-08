select p.p_partkey, ps.ps_partkey from `maprdb/json/part` as p RIGHT JOIN (select ps_partkey from `maprdb/json/partsupp` where ps_partkey>320000) as ps ON p.p_partkey = ps.ps_partkey;
