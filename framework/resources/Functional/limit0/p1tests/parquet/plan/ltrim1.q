explain plan for select * from ( select ltrim(name, 'jes'), ltrim(registration,'lib') from voter_parquet_v where voter_id=13 ) t limit 0;
