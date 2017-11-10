-- start query 99 in stream 0 using template query99.tpl 
SELECT Substr(w.w_warehouse_name, 1, 20), 
               sm.sm_type, 
               cc.cc_name, 
               Sum(CASE 
                     WHEN ( cs.cs_ship_date_sk - cs.cs_sold_date_sk <= 30 ) THEN 1 
                     ELSE 0 
                   END) AS `30 days`, 
               Sum(CASE 
                     WHEN ( cs.cs_ship_date_sk - cs.cs_sold_date_sk > 30 ) 
                          AND ( cs.cs_ship_date_sk - cs.cs_sold_date_sk <= 60 ) THEN 1 
                     ELSE 0 
                   END) AS `31-60 days`, 
               Sum(CASE 
                     WHEN ( cs.cs_ship_date_sk - cs.cs_sold_date_sk > 60 ) 
                          AND ( cs.cs_ship_date_sk - cs.cs_sold_date_sk <= 90 ) THEN 1 
                     ELSE 0 
                   END) AS `61-90 days`, 
               Sum(CASE 
                     WHEN ( cs.cs_ship_date_sk - cs.cs_sold_date_sk > 90 ) 
                          AND ( cs.cs_ship_date_sk - cs.cs_sold_date_sk <= 120 ) THEN 
                     1 
                     ELSE 0 
                   END) AS `91-120 days`, 
               Sum(CASE 
                     WHEN ( cs.cs_ship_date_sk - cs.cs_sold_date_sk > 120 ) THEN 1 
                     ELSE 0 
                   END) AS `>120 days` 
FROM   catalog_sales cs, 
       warehouse w, 
       ship_mode sm, 
       call_center cc, 
       date_dim d
WHERE  d.d_month_seq BETWEEN 1200 AND 1200 + 11 
       AND cs.cs_ship_date_sk = d.d_date_sk 
       AND cs.cs_warehouse_sk = w.w_warehouse_sk 
       AND cs.cs_ship_mode_sk = sm.sm_ship_mode_sk 
       AND cs.cs_call_center_sk = cc.cc_call_center_sk 
GROUP  BY Substr(w.w_warehouse_name, 1, 20), 
          sm.sm_type, 
          cc.cc_name 
ORDER  BY Substr(w.w_warehouse_name, 1, 20), 
          sm.sm_type, 
          cc.cc_name
LIMIT 100; 
