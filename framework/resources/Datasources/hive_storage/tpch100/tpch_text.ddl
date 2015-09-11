create database if not exists tpch100_text;
create external table if not exists tpch100_text.nation (
    n_nationkey int,
    n_name string,
    n_regionkey int,
    n_comment string
)
ROW FORMAT delimited fields terminated by '|' stored as textfile
LOCATION '/drill/testdata/tpch100/text/nation_text';

create external table if not exists tpch100_text.region (
    r_regionkey int,
    r_name string,
    r_comment string
)
ROW FORMAT delimited fields terminated by '|' stored as textfile
LOCATION '/drill/testdata/tpch100/text/region_text';

create external table if not exists tpch100_text.part (
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
ROW FORMAT delimited fields terminated by '|' stored as textfile
LOCATION '/drill/testdata/tpch100/text/part_text';

create external table if not exists tpch100_text.supplier (
    s_suppkey int,
    s_name string,
    s_address string,
    s_nationkey int,
    s_phone string,
    s_acctbal double,
    s_comment string
)
ROW FORMAT delimited fields terminated by '|' stored as textfile
LOCATION '/drill/testdata/tpch100/text/supplier_text';

create external table if not exists tpch100_text.partsupp (
    ps_partkey int,
    ps_suppkey int,
    ps_availqty int,
    ps_supplycost double,
    ps_comment string
)
ROW FORMAT delimited fields terminated by '|' stored as textfile
LOCATION '/drill/testdata/tpch100/text/partsupp_text';

create external table if not exists tpch100_text.customer (
    c_custkey int,
    c_name string,
    c_address string,
    c_nationkey int,
    c_phone string,
    c_acctbal double,
    c_mktsegment string,
    c_comment string
)
ROW FORMAT delimited fields terminated by '|' stored as textfile
LOCATION '/drill/testdata/tpch100/text/customer_text';

create external table if not exists tpch100_text.orders (
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
ROW FORMAT delimited fields terminated by '|' stored as textfile
LOCATION '/drill/testdata/tpch100/text/orders_text';

create external table if not exists tpch100_text.lineitem (
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
ROW FORMAT delimited fields terminated by '|' stored as textfile
LOCATION '/drill/testdata/tpch100/text/lineitem_text';
