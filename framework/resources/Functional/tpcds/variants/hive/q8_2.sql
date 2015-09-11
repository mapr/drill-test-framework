-- /* q8_1 */
-- /*query id: -- */
-- /*5.7 mins*/
select 
   t.wr_returning_customer_sk,
   t.wr_returned_date_sk,
   cast(sum(t.wr_return_amt)/sum(t.wr_return_quantity) as decimal(25,20)) as avg_return_amt
 from web_returns t
 where (
     t.wr_item_sk in (select ws_item_sk from web_sales where ws_sales_price < 50 or ws_ext_sales_price < 1000) 
     or t.wr_item_sk in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10) )
   and t.wr_reason_sk in (10)
group by 
   t.wr_returning_customer_sk, 
   t.wr_returned_date_sk
having sum(t.wr_return_amt)/sum(t.wr_return_quantity) >= 50.0 
order by 
   t.wr_returning_customer_sk, 
   t.wr_returned_date_sk
;

