select date_add(to_timestamp('2013/DEC/13 10:13:18', 'YYYY/MMM/dd HH:mm:ss'), interval '-55' SECOND) from voter where voter_id=10;
