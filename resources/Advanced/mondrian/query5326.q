select count(*) as c0 from (select distinct store.store_state as c0 from employee as employee, store as store where employee.store_id = store.store_id) as init;
