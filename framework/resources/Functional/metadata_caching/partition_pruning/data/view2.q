create or replace view ld2 as select dir0 num, substr(dir1, 1, 2) let, extract(day from dir2) `day`, l_orderkey, l_partkey, l_suppkey, l_linenumber, l_quantity, l_extendedorice, l_discount, l_tax from l_3level;
select num, let, `day`, l_orderkey from ld2 where num=2 and let='tw' and `day` = 12 order by l_orderkey limit 10;
select 1 from sys.version;
