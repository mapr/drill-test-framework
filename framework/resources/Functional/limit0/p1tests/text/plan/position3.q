explain plan for select * from ( select position('pub' in registration) from voter_csv_v where registration like '%pub%' ) t limit 0;
