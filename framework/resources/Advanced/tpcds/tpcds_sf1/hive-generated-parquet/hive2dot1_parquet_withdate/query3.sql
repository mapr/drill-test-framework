-- start query 3 in stream 0 using template query3.tpl 
SELECT dt.d_year, 
               i.i_brand_id          brand_id, 
               i.i_brand             brand, 
               Sum(ss.ss_ext_discount_amt) sum_agg 
FROM   date_dim dt, 
       store_sales ss, 
       item i 
WHERE  dt.d_date_sk = ss.ss_sold_date_sk 
       AND ss.ss_item_sk = i.i_item_sk 
       AND i.i_manufact_id = 427 
       AND dt.d_moy = 11 
GROUP  BY dt.d_year, 
          i.i_brand, 
          i.i_brand_id 
ORDER  BY dt.d_year, 
          sum_agg DESC, 
          brand_id
LIMIT 100;
