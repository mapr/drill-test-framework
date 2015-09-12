select store.store_country as c0 from store as store where UPPER(store.store_country) = UPPER('M') group by store.store_country order by store.store_country ASC NULLS LAST;
