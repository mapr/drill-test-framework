/* ---- Part data ---- */
-- Reading PSV Data
PART_DATA = LOAD '${DRILL_TESTDATA}/schema_change_empty_batch/hbase/part.tbl' USING PigStorage('|') as
(
row_key:long,
p_partkey:long,
p_name:chararray,
p_mfgr:chararray,
p_brand:chararray,
p_type:chararray,
p_size:int,
p_container:chararray,
p_retailprice:double,
p_comment:chararray
);

-- Writing HBase Data [Implicitly, first column is ROW_KEY]
STORE PART_DATA INTO 'schema_change_empty_batch_part' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage
('
data:p_partkey,
data:p_name,
data:p_mfgr,
data:p_brand,
data:p_type,
data:p_size,
data:p_container,
data:p_retailprice,
data:p_comment
');

/* ---- Partsupp data ---- */
-- Reading PSV Data
PARTSUPP_DATA = LOAD '${DRILL_TESTDATA}/schema_change_empty_batch/hbase/partsupp.tbl' USING PigStorage('|') as
(
row_key:long,
ps_partkey:long,
ps_suppkey:long,
ps_availqty:int,
ps_supplycost:double,
ps_comment:chararray
);

-- Writing Hbase Data [Implicitly, first column is ROW_KEY]
STORE PARTSUPP_DATA INTO 'schema_change_empty_batch_partsupp' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage
('
data:ps_partkey,
data:ps_suppkey,
data:ps_availqty,
data:ps_supplycost,
data:ps_comment
');
