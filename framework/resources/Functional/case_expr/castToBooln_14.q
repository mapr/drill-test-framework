CREATE TABLE TBL_ON_BLN_14 (c1, c2, c3, c4) AS SELECT cast(columns[0] as int), cast(columns[1] as boolean), cast(columns[2] as char(2)), cast(columns[3] as varchar(64)) FROM `bools.csv`;
select count(c1),c2 from TBL_ON_BLN_14 group by c2 order by c2;
DROP TABLE TBL_ON_BLN_14;
