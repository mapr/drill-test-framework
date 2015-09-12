select time_by_day.the_year as c0, time_by_day.quarter as c1, product_class.product_family as c2, product_class.product_department as c3, product_class.product_category as c4, product_class.product_subcategory as c5, sum(sales_fact_1997.unit_sales) as m0 from time_by_day as time_by_day, sales_fact_1997 as sales_fact_1997, product_class as product_class, product as product where sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and time_by_day.quarter in ('Q1', 'Q2') and sales_fact_1997.product_id = product.product_id and product.product_class_id = product_class.product_class_id and product_class.product_family = 'Food' and product_class.product_department in ('Canned Foods', 'Produce') and product_class.product_category in ('Canned Soup', 'Fruit', 'Vegetables') and product_class.product_subcategory in ('Fresh Fruit', 'Fresh Vegetables', 'Soup') group by time_by_day.the_year, time_by_day.quarter, product_class.product_family, product_class.product_department, product_class.product_category, product_class.product_subcategory;
