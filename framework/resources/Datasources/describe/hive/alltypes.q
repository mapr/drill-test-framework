create database if not exists hive_describe;

drop table if exists hive_describe.alltypes;
create table hive_describe.alltypes
         (c1 int, c2 boolean, c3 double, c4 string,
         c5 array<int>, c6 map<int,string>, c7 map<string,string>,
         c8 struct<r:string,s:int,t:double>,
         c9 tinyint, c10 smallint, c11 float, c12 bigint,
         c13 array<array<string>>,
         c14 map<int, map<int,int>>,
         c15 struct<r:int,s:struct<a:int,b:string>>,
         c16 array<struct<m:map<string,string>,n:int>>,
         c17 timestamp,
         c18 decimal,
         c19 binary,
         c20 date);
         
load data local inpath 'framework/resources/Datasources/describe/hive/datatypes.txt' into table hive_describe.alltypes;

drop table if exists hive_describe.alldrilltypes;
create table hive_describe.alldrilltypes
         (c1 int, c2 boolean, c3 double, c4 string,
         c9 tinyint, c10 smallint, c11 float, c12 bigint,
         c19 binary);

from hive_describe.alltypes
insert overwrite table hive_describe.alldrilltypes select c1,c2,c3,c4,c9,c10,c11,c12,c19;
