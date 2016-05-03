select voter_id, name, registration,create_date from voter_avro where registration not in ('independent','green','republican');
