select flatten(d1.r.a) from (SELECT FLATTEN(d.col1) r from (select CONVERT_FROM('[{id:1, a : [100]},{id:2,a:[]}]' ,'JSON') col1 FROM cp.`tpch/region.parquet` where r_regionkey = -1) d ) d1;
