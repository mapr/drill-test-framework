-- /* q5 */
-- /* Original query id: -- */
-- /*1.7 mins*/
select 
   ss_sold_date_sk,
   sum(case when squantity >= 1 and sorders >=1 then 1 else 0 end) as quantity_metric, 
   count(distinct(ss_customer_sk * 1000) + ss_cdemo_sk) as customer_metric
 from (
   select ss_customer_sk, 
      ss_item_sk, 
      ss_cdemo_sk,
      ss_hdemo_sk, 
      ss_sold_date_sk, 
      sum(case when ss_quantity > 20 then 1 else 0 end) as squantity, 
      sum(case when ss_ticket_number > 1000 then 1 else 0 end) as sorders
    from store_sales
    where 
      ss_item_sk in (select i_item_sk from item
                   where i_manufact_id in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25)  )
      and ss_hdemo_sk in (10, 20, 30) 
      and ss_store_sk in (1, 2, 3)
    group by 
      ss_customer_sk, 
      ss_item_sk, 
      ss_cdemo_sk, 
      ss_hdemo_sk,
      ss_sold_date_sk
   ) TT
  group by 
     TT.ss_sold_date_sk
  order by 
     TT.ss_sold_date_sk
;

