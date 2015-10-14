-- /* q8 */
-- /* query id: -- */
-- /*5.7 mins*/
select 
   t.ss_customer_sk,
   t.ss_store_sk,
   t.ss_sold_date_sk,
   cast (sum(t.ss_sales_price)/sum(t.ss_quantity) as decimal (25,20)) as avg_price
 from store_sales t
 where (
     t.ss_item_sk in (select i_item_sk from item where i_manufact_id = 10 or i_category_id = 5) 
     or t.ss_item_sk in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25) )
   and t.ss_store_sk in (1, 2, 3)
group by 
   t.ss_customer_sk, 
   t.ss_store_sk,
   t.ss_sold_date_sk
having sum(t.ss_sales_price)/sum(t.ss_quantity) >= 50.0
order by
   t.ss_customer_sk, 
   t.ss_store_sk,
   t.ss_sold_date_sk
;

