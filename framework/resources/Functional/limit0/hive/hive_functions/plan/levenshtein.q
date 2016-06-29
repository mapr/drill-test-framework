explain plan for select * from ( select levenshtein(name, registration) from voter_parquet where voter_id=10 ) t limit 0;
