-- start query 55 in stream 0 using template query55.tpl 
SELECT i.i_brand_id              brand_id, 
               i.i_brand                 brand, 
               Sum(ss.ss_ext_sales_price) ext_price 
FROM   date_dim d, 
       store_sales ss, 
       item i
WHERE  d.d_date_sk = ss.ss_sold_date_sk 
       AND ss.ss_item_sk = i.i_item_sk 
       AND i.i_manager_id = 33 
       AND d.d_moy = 12 
       AND d.d_year = 1998 
GROUP  BY i.i_brand, 
          i.i_brand_id 
ORDER  BY ext_price DESC, 
          i.i_brand_id
LIMIT 100; 
