DROP TABLE IF EXISTS NATION;
DROP TABLE IF EXISTS REGION; 
DROP TABLE IF EXISTS PART;
DROP TABLE IF EXISTS SUPPLIER;
DROP TABLE IF EXISTS PARTSUPP;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS LINEITEM;

CREATE EXTERNAL TABLE NATION  ( N_NATIONKEY  INT ,
                            N_NAME       STRING ,
                            N_REGIONKEY  INT ,
                            N_COMMENT    STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/hive_storage/nation';

CREATE EXTERNAL TABLE REGION  ( R_REGIONKEY  INT ,
                            R_NAME       STRING ,
                            R_COMMENT    STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/hive_storage/region';

CREATE EXTERNAL TABLE PART  ( P_PARTKEY     INT ,
                          P_NAME        STRING ,
                          P_MFGR        STRING ,
                          P_BRAND       STRING ,
                          P_TYPE        STRING ,
                          P_SIZE        INT ,
                          P_CONTAINER   STRING ,
                          P_RETAILPRICE FLOAT ,
                          P_COMMENT     STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/hive_storage/part';

CREATE EXTERNAL TABLE SUPPLIER ( S_SUPPKEY     INT ,
                             S_NAME        STRING ,
                             S_ADDRESS     STRING ,
                             S_NATIONKEY   INT ,
                             S_PHONE       STRING ,
                             S_ACCTBAL     FLOAT ,
                             S_COMMENT     STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/hive_storage/supplier';

CREATE EXTERNAL TABLE PARTSUPP ( PS_PARTKEY     INT ,
                             PS_SUPPKEY     INT ,
                             PS_AVAILQTY    INT ,
                             PS_SUPPLYCOST  FLOAT  ,
                             PS_COMMENT     STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/hive_storage/partsupp';

CREATE EXTERNAL TABLE CUSTOMER ( C_CUSTKEY     INT ,
                             C_NAME        STRING ,
                             C_ADDRESS     STRING ,
                             C_NATIONKEY   INT ,
                             C_PHONE       STRING ,
                             C_ACCTBAL     FLOAT   ,
                             C_MKTSEGMENT  STRING ,
                             C_COMMENT     STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/hive_storage/customer';

CREATE EXTERNAL TABLE ORDERS  ( O_ORDERKEY       INT ,
                           O_CUSTKEY        INT ,
                           O_ORDERSTATUS    STRING ,
                           O_TOTALPRICE     FLOAT ,
                           O_ORDERSTRING      STRING ,
                           O_ORDERPRIORITY  STRING ,  
                           O_CLERK          STRING , 
                           O_SHIPPRIORITY   INT ,
                           O_COMMENT        STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/hive_storage/orders';

CREATE EXTERNAL TABLE LINEITEM ( L_ORDERKEY    INT ,
                             L_PARTKEY     INT ,
                             L_SUPPKEY     INT ,
                             L_LINENUMBER  INT ,
                             L_QUANTITY    FLOAT ,
                             L_EXTENDEDPRICE  FLOAT ,
                             L_DISCOUNT    FLOAT ,
                             L_TAX         FLOAT ,
                             L_RETURNFLAG  STRING ,
                             L_LINESTATUS  STRING ,
                             L_SHIPSTRING    STRING ,
                             L_COMMITSTRING  STRING ,
                             L_RECEIPTSTRING STRING ,
                             L_SHIPINSTRUCT STRING ,
                             L_SHIPMODE     STRING ,
                             L_COMMENT      STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/drill/testdata/hive_storage/lineitem';

