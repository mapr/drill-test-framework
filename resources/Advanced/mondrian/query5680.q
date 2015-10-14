select store.store_name as c0, sum(store.store_sqft) as m0 from store as store where store.store_name in ('Store 10', 'Store 18', 'Store 20', 'Store 3', 'Store 9') group by store.store_name;
