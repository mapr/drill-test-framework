CREATE OR REPLACE VIEW VW_ON_BLN_5 (c1,c2,c3) AS SELECT cast(columns[0] as int), cast(columns[1] as boolean), cast(columns[2] as char(2)) FROM `bools.csv`;
select count(c1),c2 from VW_ON_BLN_5 group by c2 order by c2;
DROP VIEW VW_ON_BLN_5;
