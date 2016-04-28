explain plan for select * from ( select char_length(name),char_length(registration) from voter_parquet_v where age < 20 ) t limit 0;
