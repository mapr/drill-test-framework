select regexp_replace('408.123.4567', '(\d{3})\.(\d{3})\.(\d{4})','($1) $2-$3') from voter where voter_id=10;
