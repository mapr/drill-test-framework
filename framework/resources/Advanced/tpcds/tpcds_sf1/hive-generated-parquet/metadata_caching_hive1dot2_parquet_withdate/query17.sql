-- start query 17 in stream 0 using template query17.tpl 
SELECT i.i_item_id, 
               i.i_item_desc, 
               s.s_state, 
               Count(ss.ss_quantity)                                        AS 
               store_sales_quantitycount, 
               Avg(ss.ss_quantity)                                          AS 
               store_sales_quantityave, 
               Stddev_samp(ss.ss_quantity)                                  AS 
               store_sales_quantitystdev, 
               Stddev_samp(ss.ss_quantity) / Avg(ss.ss_quantity)               AS 
               store_sales_quantitycov, 
               Count(sr.sr_return_quantity)                                 AS 
               store_returns_quantitycount, 
               Avg(sr.sr_return_quantity)                                   AS 
               store_returns_quantityave, 
               Stddev_samp(sr.sr_return_quantity)                           AS 
               store_returns_quantitystdev, 
               Stddev_samp(sr.sr_return_quantity) / Avg(sr.sr_return_quantity) AS 
               store_returns_quantitycov, 
               Count(cs.cs_quantity)                                        AS 
               catalog_sales_quantitycount, 
               Avg(cs.cs_quantity)                                          AS 
               catalog_sales_quantityave, 
               Stddev_samp(cs.cs_quantity) / Avg(cs.cs_quantity)               AS 
               catalog_sales_quantitystdev, 
               Stddev_samp(cs.cs_quantity) / Avg(cs.cs_quantity)               AS 
               catalog_sales_quantitycov 
FROM   store_sales ss, 
       store_returns sr, 
       catalog_sales cs, 
       date_dim d1, 
       date_dim d2, 
       date_dim d3, 
       store s, 
       item i
WHERE  d1.d_quarter_name = '1999Q1' 
       AND d1.d_date_sk = ss.ss_sold_date_sk 
       AND i.i_item_sk = ss.ss_item_sk 
       AND s.s_store_sk = ss.ss_store_sk 
       AND ss.ss_customer_sk = sr.sr_customer_sk 
       AND ss.ss_item_sk = sr.sr_item_sk 
       AND ss.ss_ticket_number = sr.sr_ticket_number 
       AND sr.sr_returned_date_sk = d2.d_date_sk 
       AND d2.d_quarter_name IN ( '1999Q1', '1999Q2', '1999Q3' ) 
       AND sr.sr_customer_sk = cs.cs_bill_customer_sk 
       AND sr.sr_item_sk = cs.cs_item_sk 
       AND cs.cs_sold_date_sk = d3.d_date_sk 
       AND d3.d_quarter_name IN ( '1999Q1', '1999Q2', '1999Q3' ) 
GROUP  BY i.i_item_id, 
          i.i_item_desc, 
          s.s_state 
ORDER  BY i.i_item_id, 
          i.i_item_desc, 
          s.s_state
LIMIT 100; 
