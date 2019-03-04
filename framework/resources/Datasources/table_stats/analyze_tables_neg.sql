set `store.parquet.reader.int96_as_timestamp`=true;
analyze table `table_stats/voter_pig` compute statistics;
reset `store.parquet.reader.int96_as_timestamp`;
