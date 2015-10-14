select store.store_country as c0 from employee as employee, store as store where employee.store_id = store.store_id group by store.store_country order by store.store_country ASC NULLS LAST;
