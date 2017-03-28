create table `drill4234` partition by (l_moddate) as select l.*, l_shipdate - extract(day from l_shipdate) + 1 l_moddate from cp.`tpch/lineitem.parquet` l;
select count(*) from `drill4234`;
drop table `drill4234`;
