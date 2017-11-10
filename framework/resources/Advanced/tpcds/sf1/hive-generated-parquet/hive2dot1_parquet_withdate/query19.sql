-- start query 19 in stream 0 using template query19.tpl 
SELECT i.i_brand_id              brand_id, 
               i.i_brand                 brand, 
               i.i_manufact_id, 
               i.i_manufact, 
               Sum(ss.ss_ext_sales_price) ext_price 
FROM   date_dim dd, 
       store_sales ss, 
       item i, 
       customer c, 
       customer_address ca, 
       store s
WHERE  dd.d_date_sk = ss.ss_sold_date_sk 
       AND ss.ss_item_sk = i.i_item_sk 
       AND i.i_manager_id = 38 
       AND dd.d_moy = 12 
       AND dd.d_year = 1998 
       AND ss.ss_customer_sk = c.c_customer_sk 
       AND c.c_current_addr_sk = ca.ca_address_sk 
       AND Substr(ca.ca_zip, 1, 5) <> Substr(s.s_zip, 1, 5) 
       AND ss.ss_store_sk = s.s_store_sk 
GROUP  BY i.i_brand, 
          i.i_brand_id, 
          i.i_manufact_id, 
          i.i_manufact 
ORDER  BY ext_price DESC, 
          i.i_brand, 
          i.i_brand_id, 
          i.i_manufact_id, 
          i.i_manufact
LIMIT 100; 
