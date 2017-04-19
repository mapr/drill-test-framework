-- start query 93 in stream 0 using template query93.tpl 
SELECT t.ss_customer_sk, 
               Sum(t.act_sales) sumsales 
FROM   (SELECT ss.ss_item_sk, 
               ss.ss_ticket_number, 
               ss.ss_customer_sk, 
               CASE 
                 WHEN sr.sr_return_quantity IS NOT NULL THEN 
                 ( ss.ss_quantity - sr.sr_return_quantity ) * ss.ss_sales_price 
                 ELSE ( ss.ss_quantity * ss.ss_sales_price ) 
               END act_sales 
        FROM   store_sales ss 
               LEFT OUTER JOIN store_returns sr
                            ON ( sr.sr_item_sk = ss.ss_item_sk 
                                 AND sr.sr_ticket_number = ss.ss_ticket_number ), 
               reason r
        WHERE  sr.sr_reason_sk = r.r_reason_sk 
               AND r.r_reason_desc = 'reason 38') t 
GROUP  BY t.ss_customer_sk 
ORDER  BY sumsales, 
          t.ss_customer_sk
LIMIT 100; 
