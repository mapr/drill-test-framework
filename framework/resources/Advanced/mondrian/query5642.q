select product_class.product_family as c0, product_class.product_department as c1, product_class.product_category as c2, product_class.product_subcategory as c3, product.brand_name as c4, product.product_name as c5 from product as product, product_class as product_class, sales_fact_1997 as sales_fact_1997, time_by_day as time_by_day where product.product_class_id = product_class.product_class_id and sales_fact_1997.product_id = product.product_id and sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and time_by_day.quarter in ('Q1', 'Q2') group by product_class.product_family, product_class.product_department, product_class.product_category, product_class.product_subcategory, product.brand_name, product.product_name order by sum(sales_fact_1997.store_sales) DESC NULLS LAST, product_class.product_family ASC NULLS LAST, product_class.product_department ASC NULLS LAST, product_class.product_category ASC NULLS LAST, product_class.product_subcategory ASC NULLS LAST, product.brand_name ASC NULLS LAST, product.product_name ASC NULLS LAST;
