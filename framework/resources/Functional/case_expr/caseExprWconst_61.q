SELECT (CASE WHEN true THEN coalesce(coalesce(1,0),1) ELSE 1 END) FROM (VALUES(1)) test_tbl;