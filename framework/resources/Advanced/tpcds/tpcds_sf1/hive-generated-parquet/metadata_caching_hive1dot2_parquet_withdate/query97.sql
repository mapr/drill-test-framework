
-- start query 97 in stream 0 using template query97.tpl 
WITH ssci 
     AS (SELECT ss.ss_customer_sk customer_sk, 
                ss.ss_item_sk     item_sk 
         FROM   store_sales ss, 
                date_dim d
         WHERE  ss.ss_sold_date_sk = d.d_date_sk 
                AND d.d_month_seq BETWEEN 1196 AND 1196 + 11 
         GROUP  BY ss.ss_customer_sk, 
                   ss.ss_item_sk), 
     csci 
     AS (SELECT cs.cs_bill_customer_sk customer_sk, 
                cs.cs_item_sk          item_sk 
         FROM   catalog_sales cs, 
                date_dim d
         WHERE  cs.cs_sold_date_sk = d.d_date_sk 
                AND d.d_month_seq BETWEEN 1196 AND 1196 + 11 
         GROUP  BY cs.cs_bill_customer_sk, 
                   cs.cs_item_sk) 
SELECT Sum(CASE 
                     WHEN ssci.customer_sk IS NOT NULL 
                          AND csci.customer_sk IS NULL THEN 1 
                     ELSE 0 
                   END) store_only, 
               Sum(CASE 
                     WHEN ssci.customer_sk IS NULL 
                          AND csci.customer_sk IS NOT NULL THEN 1 
                     ELSE 0 
                   END) catalog_only, 
               Sum(CASE 
                     WHEN ssci.customer_sk IS NOT NULL 
                          AND csci.customer_sk IS NOT NULL THEN 1 
                     ELSE 0 
                   END) store_and_catalog 
FROM   ssci 
       FULL OUTER JOIN csci 
                    ON ( ssci.customer_sk = csci.customer_sk 
                         AND ssci.item_sk = csci.item_sk )
LIMIT 100; 
