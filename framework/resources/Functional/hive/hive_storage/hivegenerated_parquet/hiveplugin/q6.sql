select count(*) from (select case when date_col is null then date '2014-01-02' else date'2014-01-01' end dt from hive1_fewtypes_null_parquet) d group by d.dt;
