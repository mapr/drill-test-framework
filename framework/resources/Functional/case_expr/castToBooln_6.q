CREATE OR REPLACE VIEW VW_ON_BLN_6 (c1,c2,c3) AS SELECT cast(columns[0] as int), cast(columns[1] as boolean), cast(columns[2] as char(2)) FROM `bools.csv`;
select * from VW_ON_BLN_6 WHERE c2 = false;
DROP VIEW VW_ON_BLN_6;
