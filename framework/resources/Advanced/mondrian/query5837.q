select store.store_state as c0, sum(customer.num_cars_owned) as m0 from store as store, customer as customer where customer.state_province = store.store_state group by store.store_state;
