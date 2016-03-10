-- start query 33 in stream 0 using template query33.tpl 
WITH ss 
     AS (SELECT i.i_manufact_id, 
                Sum(ss.ss_ext_sales_price) total_sales 
         FROM   store_sales ss, 
                date_dim dd, 
                customer_address ca, 
                item i
         WHERE  i.i_manufact_id IN (SELECT i.i_manufact_id 
                                  FROM   item i
                                  WHERE  i.i_category IN ( 'Books' )) 
                AND ss.ss_item_sk = i.i_item_sk 
                AND ss.ss_sold_date_sk = dd.d_date_sk 
                AND dd.d_year = 1999 
                AND dd.d_moy = 3 
                AND ss.ss_addr_sk = ca.ca_address_sk 
                AND ca.ca_gmt_offset = -5 
         GROUP  BY i.i_manufact_id), 
     cs 
     AS (SELECT i.i_manufact_id, 
                Sum(cs.cs_ext_sales_price) total_sales 
         FROM   catalog_sales cs, 
                date_dim dd, 
                customer_address ca, 
                item i
         WHERE  i.i_manufact_id IN (SELECT i.i_manufact_id 
                                  FROM   item i 
                                  WHERE  i.i_category IN ( 'Books' )) 
                AND cs.cs_item_sk = i.i_item_sk 
                AND cs.cs_sold_date_sk = dd.d_date_sk 
                AND dd.d_year = 1999 
                AND dd.d_moy = 3 
                AND cs.cs_bill_addr_sk = ca.ca_address_sk 
                AND ca.ca_gmt_offset = -5 
         GROUP  BY i.i_manufact_id), 
     ws 
     AS (SELECT i.i_manufact_id, 
                Sum(ws.ws_ext_sales_price) total_sales 
         FROM   web_sales ws, 
                date_dim dd, 
                customer_address ca, 
                item i
         WHERE  i.i_manufact_id IN (SELECT i.i_manufact_id 
                                  FROM   item i
                                  WHERE  i.i_category IN ( 'Books' )) 
                AND ws.ws_item_sk = i.i_item_sk 
                AND ws.ws_sold_date_sk = dd.d_date_sk 
                AND dd.d_year = 1999 
                AND dd.d_moy = 3 
                AND ws.ws_bill_addr_sk = ca.ca_address_sk 
                AND ca.ca_gmt_offset = -5 
         GROUP  BY i.i_manufact_id) 
SELECT i_manufact_id, 
               Sum(total_sales) total_sales 
FROM   (SELECT * 
        FROM   ss 
        UNION ALL 
        SELECT * 
        FROM   cs 
        UNION ALL 
        SELECT * 
        FROM   ws) tmp1 
GROUP  BY i_manufact_id 
ORDER  BY total_sales
LIMIT 100; 
