explain plan for select * from ( select distinct(create_time) from voter_csv_v where registration <> 'independent' ) t limit 0;
