select store.coffee_bar as c0, sum(store.store_sqft) as m0 from store as store group by store.coffee_bar;
