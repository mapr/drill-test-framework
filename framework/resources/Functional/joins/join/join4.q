alter session set `planner.enable_broadcast_join` = false;
alter session set `planner.enable_mergejoin` = false;
select store.store_id, store.store_name, store.store_city, store.store_state, store.store_postal_code, store.store_country, region.region_id, region.sales_city from store right join region on store.region_id = region.region_id order by region.region_id;
alter session set `planner.enable_mergejoin` = true;
alter session set `planner.enable_broadcast_join` = true;
