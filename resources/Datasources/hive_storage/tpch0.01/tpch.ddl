create database if not exists tpch01_parquet_nodate;
create external table if not exists tpch01_parquet_nodate.nation (
    n_nationkey int,
    n_name string,
    n_regionkey int,
    n_comment string
)
STORED AS PARQUET
LOCATION '/drill/testdata/Tpch0.01/parquet/nation/nation.parquet';


create external table if not exists tpch01_parquet_nodate.region (
    r_regionkey int,
    r_name string,
    r_comment string
)
STORED AS PARQUET
LOCATION '/drill/testdata/Tpch0.01/parquet/region/region.parquet';


create external table if not exists tpch01_parquet_nodate.part (
    p_partkey int,
    p_name string,
    p_mfgr string,
    p_brand string,
    p_type string,
    p_size int,
    p_container string,
    p_retailprice double,
    p_comment string
)
STORED AS PARQUET
LOCATION '/drill/testdata/Tpch0.01/parquet/part/part.parquet';


create external table if not exists tpch01_parquet_nodate.supplier (
    s_suppkey int,
    s_name string,
    s_address string,
    s_nationkey int,
    s_phone string,
    s_acctbal double,
    s_comment string
)
STORED AS PARQUET
LOCATION '/drill/testdata/Tpch0.01/parquet/supplier/supplier.parquet';


create external table if not exists tpch01_parquet_nodate.partsupp (
    ps_partkey int,
    ps_suppkey int,
    ps_availqty int,
    ps_supplycost double,
    ps_comment string
)
STORED AS PARQUET
LOCATION '/drill/testdata/Tpch0.01/parquet/partsupp/partsupp.parquet';


create external table if not exists tpch01_parquet_nodate.customer (
    c_custkey int,
    c_name string,
    c_address string,
    c_nationkey int,
    c_phone string,
    c_acctbal double,
    c_mktsegment string,
    c_comment string
)
STORED AS PARQUET
LOCATION '/drill/testdata/Tpch0.01/parquet/customer/customer.parquet';

create external table if not exists tpch01_parquet_nodate.orders (
    o_orderkey int,
    o_custkey int,
    o_orderstatus string,
    o_totalprice double,
    o_orderdate string,
    o_orderpriority string,
    o_clerk string,
    o_shippriority int,
    o_comment string
)
STORED AS PARQUET
LOCATION '/drill/testdata/hive_storage/tpch0.01/orders_nodate.parquet';

create external table if not exists tpch01_parquet_nodate.lineitem (
    l_orderkey int,
    l_partkey int,
    l_suppkey int,
    l_linenumber int,
    l_quantity double,
    l_extendedprice double,
    l_discount double,
    l_tax double,
    l_returnflag string,
    l_linestatus string,
    l_shipdate string,
    l_commitdate string,
    l_receiptdate string,
    l_shipinstruct string, 
    l_shipmode string, 
    l_comment string
)
STORED AS PARQUET
LOCATION '/drill/testdata/hive_storage/tpch0.01/lineitem_nodate.parquet';
