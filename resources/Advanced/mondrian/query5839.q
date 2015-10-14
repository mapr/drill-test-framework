select FACT.warehouse_id as c0 from (select * from inventory_fact_1997 as FOOBAR) as FACT where FACT.warehouse_id = 2 group by FACT.warehouse_id order by FACT.warehouse_id ASC NULLS LAST;
