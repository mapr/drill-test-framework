create table region partition by (r_bool) as select r.*, case when substr(r_name, 1,1) = 'A' then true else false end r_bool from cp.`tpch/region.parquet` r;
select * from region where r_bool is true;
drop table region;
