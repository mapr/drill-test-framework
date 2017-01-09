CREATE OR REPLACE VIEW VW_ON_BLN_1 (c1,c2,c3) AS SELECT cast(columns[0] as int), cast(columns[1] as boolean), cast(columns[2] as char(2)) FROM `bools.csv`;
select count(*) from VW_ON_BLN_1;
DROP VIEW VW_ON_BLN_1;
