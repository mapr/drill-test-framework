select business_id, city, state, flatten(categories) as categories from business order by business_id, city, state, categories limit 20;
