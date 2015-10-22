select * from t1 where a1 < ( select a2 from t2 limit 1 );
