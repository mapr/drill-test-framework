select count(*) from (select distinct FACT.store_type as c0 from (select * from store as FOOBAR) as FACT) as init;
