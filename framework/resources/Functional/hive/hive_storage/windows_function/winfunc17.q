select registration,row_number() over(partition by registration order by registration nulls first,age nulls first) as RN,age from voter_hive order by registration nulls first;
