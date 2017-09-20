select l_shipdate, `month`(l_shipdate) from cp.`tpch/lineitem.parquet` where l_shipdate = date '1998-06-02' limit 2;
