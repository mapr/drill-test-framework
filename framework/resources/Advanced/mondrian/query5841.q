select count(*) from (select distinct FACT.warehouse_id as c0 from (select * from inventory_fact_1997 as FOOBAR) as FACT) as init;
