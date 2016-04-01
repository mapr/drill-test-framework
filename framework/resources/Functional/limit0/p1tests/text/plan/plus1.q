explain plan for select * from ( select (voter_id + 5),(age + 5), (contributions + 35), (contributions + 50), (voterzone + 500) from voter_csv_v where voter_id=10 ) t limit 0;
