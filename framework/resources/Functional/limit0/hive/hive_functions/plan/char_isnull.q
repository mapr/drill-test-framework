explain plan for select * from ( select voter_id, name, create_date, registration from voter_avro where registration is null ) t limit 0;
