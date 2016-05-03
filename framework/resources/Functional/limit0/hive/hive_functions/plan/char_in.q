explain plan for select * from ( select voter_id, name, create_date from voter_orc where registration in ('independent','green') and create_date < '2016-09-01' ) t limit 0;
