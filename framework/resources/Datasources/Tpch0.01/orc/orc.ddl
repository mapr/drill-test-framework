create database if not exists tpch01_orc;

create  external table if not exists tpch01_orc.nation (
    n_nationkey int,
    n_name string,
    n_regionkey int,
    n_comment string
)
STORED AS orc
LOCATION '/drill/testdata/Tpch0.01/orc/nation';


create external table if not exists tpch01_orc.region (
    r_regionkey int,
    r_name string,
    r_comment string
)
STORED AS orc
LOCATION '/drill/testdata/Tpch0.01/orc/region';


create external table if not exists tpch01_orc.part (
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
STORED AS orc
LOCATION '/drill/testdata/Tpch0.01/orc/part';

create external table if not exists tpch01_orc.supplier (
    s_suppkey int,
    s_name string,
    s_address string,
    s_nationkey int,
    s_phone string,
    s_acctbal double,
    s_comment string
)
STORED AS orc
LOCATION '/drill/testdata/Tpch0.01/orc/supplier';


create external table if not exists tpch01_orc.partsupp (
    ps_partkey int,
    ps_suppkey int,
    ps_availqty int,
    ps_supplycost double,
    ps_comment string
)
STORED AS orc
LOCATION '/drill/testdata/Tpch0.01/orc/partsupp';

create external table if not exists tpch01_orc.customer (
    c_custkey int,
    c_name string,
    c_address string,
    c_nationkey int,
    c_phone string,
    c_acctbal double,
    c_mktsegment string,
    c_comment string
)
STORED AS orc
LOCATION '/drill/testdata/Tpch0.01/orc/customer';


create external table if not exists tpch01_orc.lineitem (
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
    l_shipdate date,
    l_commitdate date,
    l_receiptdate date,
    l_shipinstruct string,
    l_shipmode string,
    l_comment string
)
STORED AS orc
LOCATION '/drill/testdata/Tpch0.01/orc/lineitem';


create external table if not exists tpch01_orc.orders (
    o_orderkey int,
    o_custkey int,
    o_orderstatus string,
    o_totalprice double,
    o_orderdate date,
    o_orderpriority string,
    o_clerk string,
    o_shippriority int,
    o_comment string
)
STORED AS orc
LOCATION '/drill/testdata/Tpch0.01/orc/orders';

