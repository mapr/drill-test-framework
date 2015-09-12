select FACT.store_type as c0 from (select * from store as FOOBAR) as FACT group by FACT.store_type order by FACT.store_type ASC NULLS LAST;
