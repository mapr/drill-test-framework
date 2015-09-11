alter session set `planner.enable_hashjoin` = false;
select store.store_id, store.store_name, store.store_city, store.store_state, store.store_postal_code, store.store_country, region.region_id, region.sales_city from store left join region on store.region_id = region.region_id order by region.region_id;
alter session set `planner.enable_hashjoin` = true;
