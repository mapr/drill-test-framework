select store.store_state as c0 from store as store, inventory_fact_1997 as inventory_fact_1997 where inventory_fact_1997.store_id = store.store_id and store.store_country = 'USA' group by store.store_state order by store.store_state ASC NULLS LAST;
