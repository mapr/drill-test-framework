explain plan for select * from ( select trim(both 'l' from name), trim(both 's' from registration) from voter_csv_v where voter_id=10 ) t limit 0;
