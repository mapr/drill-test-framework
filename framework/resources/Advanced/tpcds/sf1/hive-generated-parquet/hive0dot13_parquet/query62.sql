-- start query 62 in stream 0 using template query62.tpl 
SELECT Substr(w.w_warehouse_name, 1, 20), 
               sm.sm_type, 
               web.web_name, 
               Sum(CASE 
                     WHEN ( ws.ws_ship_date_sk - ws.ws_sold_date_sk <= 30 ) THEN 1 
                     ELSE 0 
                   END) AS `30 days`, 
               Sum(CASE 
                     WHEN ( ws.ws_ship_date_sk - ws.ws_sold_date_sk > 30 ) 
                          AND ( ws.ws_ship_date_sk - ws.ws_sold_date_sk <= 60 ) THEN 1 
                     ELSE 0 
                   END) AS `31-60 days`, 
               Sum(CASE 
                     WHEN ( ws.ws_ship_date_sk - ws.ws_sold_date_sk > 60 ) 
                          AND ( ws.ws_ship_date_sk - ws.ws_sold_date_sk <= 90 ) THEN 1 
                     ELSE 0 
                   END) AS `61-90 days`, 
               Sum(CASE 
                     WHEN ( ws.ws_ship_date_sk - ws.ws_sold_date_sk > 90 ) 
                          AND ( ws.ws_ship_date_sk - ws.ws_sold_date_sk <= 120 ) THEN 
                     1 
                     ELSE 0 
                   END) AS `91-120 days`, 
               Sum(CASE 
                     WHEN ( ws.ws_ship_date_sk - ws.ws_sold_date_sk > 120 ) THEN 1 
                     ELSE 0 
                   END) AS `>120 days` 
FROM   web_sales ws, 
       warehouse w, 
       ship_mode sm, 
       web_site web, 
       date_dim d
WHERE  d.d_month_seq BETWEEN 1222 AND 1222 + 11 
       AND ws.ws_ship_date_sk = d.d_date_sk 
       AND ws.ws_warehouse_sk = w.w_warehouse_sk 
       AND ws.ws_ship_mode_sk = sm.sm_ship_mode_sk 
       AND ws.ws_web_site_sk = web.web_site_sk 
GROUP  BY Substr(w.w_warehouse_name, 1, 20), 
          sm.sm_type, 
          web.web_name 
ORDER  BY Substr(w.w_warehouse_name, 1, 20), 
          sm.sm_type, 
          web.web_name
LIMIT 100; 
