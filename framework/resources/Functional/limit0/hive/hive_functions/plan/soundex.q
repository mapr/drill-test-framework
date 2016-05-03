explain plan for select * from ( select soundex(name), soundex(registration) from voter_parquet where registration='democrat' ) t limit 0;
