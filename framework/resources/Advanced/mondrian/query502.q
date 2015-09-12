select time_by_day.the_year as c0, time_by_day.quarter as c1, product_class.product_family as c2, product_class.product_department as c3, product_class.product_category as c4, customer.gender as c5, sum(sales_fact_1997.store_cost) as m0, sum(sales_fact_1997.store_sales) as m1 from time_by_day as time_by_day, sales_fact_1997 as sales_fact_1997, product_class as product_class, product as product, customer as customer where sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and time_by_day.quarter in ('Q1', 'Q2') and sales_fact_1997.product_id = product.product_id and product.product_class_id = product_class.product_class_id and product_class.product_department in ('Carousel', 'Checkout', 'Health and Hygiene', 'Household', 'Periodicals', 'Seafood', 'Snack Foods', 'Snacks', 'Starchy Foods') and product_class.product_category in ('Bathroom Products', 'Candles', 'Candy', 'Cleaning Supplies', 'Cold Remedies', 'Decongestants', 'Electrical', 'Hardware', 'Hygiene', 'Kitchen Products', 'Magazines', 'Miscellaneous', 'Pain Relievers', 'Paper Products', 'Plastic Products', 'Seafood', 'Snack Foods', 'Specialty', 'Starchy Foods') and sales_fact_1997.customer_id = customer.customer_id and customer.gender = 'F' group by time_by_day.the_year, time_by_day.quarter, product_class.product_family, product_class.product_department, product_class.product_category, customer.gender;
