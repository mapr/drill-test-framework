explain plan for select * from ( select distinct(registration) from voter_csv_v where registration <> 'independent' ) t limit 0;
