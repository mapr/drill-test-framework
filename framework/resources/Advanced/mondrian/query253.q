select store.store_city as c0 from store as store where (store.store_state = 'CA') and UPPER(store.store_city) = UPPER('San Diego') group by store.store_city order by store.store_city ASC NULLS LAST;
