SELECT (CASE WHEN FALSE THEN CAST(null as VARCHAR(1)) ELSE CAST(null as CHAR(1)) END) FROM (VALUES(1)) test_tbl;