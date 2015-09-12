select customer.city as c0 from promotion as promotion, sales_fact_1997 as sales_fact_1997, customer as customer where sales_fact_1997.promotion_id = promotion.promotion_id and promotion.promotion_name = 'Big Promo' and sales_fact_1997.customer_id = customer.customer_id and customer.state_province = 'WA' group by customer.city order by customer.city ASC NULLS LAST;
