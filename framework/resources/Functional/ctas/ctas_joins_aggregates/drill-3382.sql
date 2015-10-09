create table `lineitem__5` as select l_suppkey, l_partkey, l_linenumber from cp.`tpch/lineitem.parquet` l order by l_linenumber;

select count(*) from `lineitem__5`;

drop table `lineitem__5`;
