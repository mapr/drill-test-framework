explain plan for select * from (
select find_in_set('ab', 'abc,b,ab,c,def') from hive.crosssources.fewtypes_null_hive) t limit 0;
