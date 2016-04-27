explain plan for select * from ( select min(cast(c_interval_month as interval month)) from `interval_data.parquet` ) t limit 0;
