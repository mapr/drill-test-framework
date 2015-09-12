select store.store_number as c0, store.store_name as c1 from store as store group by store.store_number, store.store_name order by store.store_name ASC NULLS LAST;
