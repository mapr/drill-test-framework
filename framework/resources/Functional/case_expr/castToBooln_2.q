CREATE OR REPLACE VIEW VW_ON_BLN_2 (c1,c2,c3) AS SELECT cast(columns[0] as int), cast(columns[1] as boolean), cast(columns[2] as char(2)) FROM `bools.csv`;
select * from VW_ON_BLN_2 ORDER BY c2;
DROP VIEW VW_ON_BLN_2;
