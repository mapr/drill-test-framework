-- start query 76 in stream 0 using template query76.tpl 
SELECT channel, 
               col_name, 
               d_year, 
               d_qoy, 
               i_category, 
               Count(*)             sales_cnt, 
               Sum(ext_sales_price) sales_amt 
FROM   (SELECT 'store'            AS channel, 
               'ss_hdemo_sk'      col_name, 
               d.d_year, 
               d.d_qoy, 
               i.i_category, 
               ss.ss_ext_sales_price ext_sales_price 
        FROM   store_sales ss, 
               item i, 
               date_dim d 
        WHERE  ss.ss_hdemo_sk IS NULL 
               AND ss.ss_sold_date_sk = d.d_date_sk 
               AND ss.ss_item_sk = i.i_item_sk 
        UNION ALL 
        SELECT 'web'              AS channel, 
               'ws_ship_hdemo_sk' col_name, 
               d.d_year, 
               d.d_qoy, 
               i.i_category, 
               ws.ws_ext_sales_price ext_sales_price 
        FROM   web_sales ws, 
               item i, 
               date_dim d 
        WHERE  ws.ws_ship_hdemo_sk IS NULL 
               AND ws.ws_sold_date_sk = d.d_date_sk 
               AND ws.ws_item_sk = i.i_item_sk 
        UNION ALL 
        SELECT 'catalog'          AS channel, 
               'cs_warehouse_sk'  col_name, 
               d.d_year, 
               d.d_qoy, 
               i.i_category, 
               cs.cs_ext_sales_price ext_sales_price 
        FROM   catalog_sales cs, 
               item i, 
               date_dim d 
        WHERE  cs.cs_warehouse_sk IS NULL 
               AND cs.cs_sold_date_sk = d.d_date_sk 
               AND cs.cs_item_sk = i.i_item_sk) foo 
GROUP  BY channel, 
          col_name, 
          d_year, 
          d_qoy, 
          i_category 
ORDER  BY channel, 
          col_name, 
          d_year, 
          d_qoy, 
          i_category
LIMIT 100; 
