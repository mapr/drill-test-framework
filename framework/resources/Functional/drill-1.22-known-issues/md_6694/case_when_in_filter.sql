-- expected: MD-6694 Expected section
SELECT * FROM (SELECT (CASE WHEN (true) THEN 'qwe' ELSE null END) res1 FROM (VALUES(1)) test_tbl) test WHERE res1 IN ('ab','dab','qw','qwe')
