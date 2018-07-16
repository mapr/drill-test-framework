# Advanced Test Suites 

Datasets for some of the Advanced Test Suites are not shipped with the repository. You can get them as follows:

### TPC-H SF 100

For the [TPC-H SF100 Parquet tests](tpch/tpch_sf100/parquet), download dataset from [Amazon S3](http://drill-public.s3.amazonaws.com/tpch/sf100/parquet/tpch_sf100_parquet.tgz) 

Extract this compressed file and copy over files to MapR-FS / HDFS into `/drill/testdata/tpch100/parquet`

### TPC-DS SF 100

For the [TPC-DS SF100 tests](tpcds/tpcds_sf100), download dataset from [Amazon S3](https://s3.us-west-1.amazonaws.com/drill-public/tpcds/sf100/parquet/tpcds_sf100_parquet.tar.gz) 

Extract this compressed file and copy over files to MapR-FS / HDFS into `/drill/testdata/tpcds_sf100/parquet`

### Mondrian

For the [Mondrian tests](mondrian), download dataset from [Amazon S3](http://drill-public.s3.amazonaws.com/mondrian/mondrian.tgz) 

Extract this compressed file and copy over files to MapR-FS / HDFS into `/drill/testdata/mondrian`

### Metadata Caching
Download the required data set from  https://s3.amazonaws.com/apache-drill/files/tpch100_dir_partitioned_50000files-lineitem.tgz
Extract this compresses file and copy over files to "/drill/testdata/tpch100_dir_partitioned_50000files/lineitem"

### Data-shapes widestring

For the [data-shapes widestring 100000rows parquet tests](data-shapes/wide-columns/5000/100000rows/parquet), download dataset from [Amazon S3](http://drill-public.s3.amazonaws.com/data-shapes/wide-columns/5000/100000rows/parquet/widestrings.tar.gz)

Extract this compressed file and copy over files to MapR-FS / HDFS into `/drill/testdata/data-shapes/wide-columns/5000/100000rows/parquet`
