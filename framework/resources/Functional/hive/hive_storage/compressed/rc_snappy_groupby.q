select count(*) from (select case when date_col is null then date '2014-01-02' else date'2014-01-01' end dt from hive.fewtypes_null_compressed_rc_snappy) d group by d.dt;
