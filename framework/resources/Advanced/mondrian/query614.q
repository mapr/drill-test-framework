select store.store_name as c0, sum(inventory_fact_1997.store_invoice) as m0 from store as store, inventory_fact_1997 as inventory_fact_1997 where inventory_fact_1997.store_id = store.store_id group by store.store_name;
