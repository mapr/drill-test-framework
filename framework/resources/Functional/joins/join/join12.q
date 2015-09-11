alter session set `planner.enable_mergejoin` = false;
select store.store_id, store.store_name, store.store_city, store.store_state, store.store_postal_code, store.store_country, region.region_id, region.sales_city, warehouse.warehouse_name from store, region, warehouse where store.region_id = region.region_id and store.store_id = warehouse.stores_id order by region.region_id;
alter session set `planner.enable_mergejoin` = true;
