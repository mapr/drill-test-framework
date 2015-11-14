SELECT sum(c1),c3 from `parquet/nested_dir/data/parquet` where c3 IN ('CA','ID','MD','DE') GROUP BY c3 order by c3 limit 2;
