CREATE OR REPLACE VIEW Drill2461View AS SELECT CAST( NULL AS INTERVAL HOUR ) FROM INFORMATION_SCHEMA.CATALOGS LIMIT 1;
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Drill2461View';
drop view Drill2461View;
