select store.store_state as c0, sum(store.store_sqft) as m0, sum(store.grocery_sqft) as m1, count(*) as m2 from store as store where store.store_state = 'CA' group by store.store_state;
