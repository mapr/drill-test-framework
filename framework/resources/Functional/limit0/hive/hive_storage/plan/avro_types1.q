explain plan for select * from (
select cast(string1 as varchar(1)), cast(int1 as double), cast(smallint1 as float), bigint1/10, case when(boolean1 = true) then 1 else 0 end, float1/bigint1, double1/float1, lower(enum1), cast(nullableint as varchar(1)), nullableint + 25 from hive.as_avro1) t limit 0;
