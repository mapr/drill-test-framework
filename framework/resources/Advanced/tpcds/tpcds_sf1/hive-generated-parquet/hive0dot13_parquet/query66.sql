-- start query 66 in stream 0 using template query66.tpl 
SELECT x.w_warehouse_name, 
               x.w_warehouse_sq_ft, 
               x.w_city, 
               x.w_county, 
               x.w_state, 
               x.w_country, 
               x.ship_carriers, 
               x.year1,
               Sum(x.jan_sales)                     AS jan_sales, 
               Sum(x.feb_sales)                     AS feb_sales, 
               Sum(x.mar_sales)                     AS mar_sales, 
               Sum(x.apr_sales)                     AS apr_sales, 
               Sum(x.may_sales)                     AS may_sales, 
               Sum(x.jun_sales)                     AS jun_sales, 
               Sum(x.jul_sales)                     AS jul_sales, 
               Sum(x.aug_sales)                     AS aug_sales, 
               Sum(x.sep_sales)                     AS sep_sales, 
               Sum(x.oct_sales)                     AS oct_sales, 
               Sum(x.nov_sales)                     AS nov_sales, 
               Sum(x.dec_sales)                     AS dec_sales, 
               Sum(x.jan_sales / x.w_warehouse_sq_ft) AS jan_sales_per_sq_foot, 
               Sum(x.feb_sales / x.w_warehouse_sq_ft) AS feb_sales_per_sq_foot, 
               Sum(x.mar_sales / x.w_warehouse_sq_ft) AS mar_sales_per_sq_foot, 
               Sum(x.apr_sales / x.w_warehouse_sq_ft) AS apr_sales_per_sq_foot, 
               Sum(x.may_sales / x.w_warehouse_sq_ft) AS may_sales_per_sq_foot, 
               Sum(x.jun_sales / x.w_warehouse_sq_ft) AS jun_sales_per_sq_foot, 
               Sum(x.jul_sales / x.w_warehouse_sq_ft) AS jul_sales_per_sq_foot, 
               Sum(x.aug_sales / x.w_warehouse_sq_ft) AS aug_sales_per_sq_foot, 
               Sum(x.sep_sales / x.w_warehouse_sq_ft) AS sep_sales_per_sq_foot, 
               Sum(x.oct_sales / x.w_warehouse_sq_ft) AS oct_sales_per_sq_foot, 
               Sum(x.nov_sales / x.w_warehouse_sq_ft) AS nov_sales_per_sq_foot, 
               Sum(x.dec_sales / x.w_warehouse_sq_ft) AS dec_sales_per_sq_foot, 
               Sum(x.jan_net)                       AS jan_net, 
               Sum(x.feb_net)                       AS feb_net, 
               Sum(x.mar_net)                       AS mar_net, 
               Sum(x.apr_net)                       AS apr_net, 
               Sum(x.may_net)                       AS may_net, 
               Sum(x.jun_net)                       AS jun_net, 
               Sum(x.jul_net)                       AS jul_net, 
               Sum(x.aug_net)                       AS aug_net, 
               Sum(x.sep_net)                       AS sep_net, 
               Sum(x.oct_net)                       AS oct_net, 
               Sum(x.nov_net)                       AS nov_net, 
               Sum(x.dec_net)                       AS dec_net 
FROM   (SELECT w.w_warehouse_name, 
               w.w_warehouse_sq_ft, 
               w.w_city, 
               w.w_county, 
               w.w_state, 
               w.w_country, 
               'ZOUROS' 
               || ',' 
               || 'ZHOU' AS ship_carriers, 
               d.d_year    AS year1, 
               Sum(CASE 
                     WHEN d.d_moy = 1 THEN ws.ws_ext_sales_price * ws.ws_quantity 
                     ELSE 0 
                   END)  AS jan_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 2 THEN ws.ws_ext_sales_price * ws.ws_quantity 
                     ELSE 0 
                   END)  AS feb_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 3 THEN ws.ws_ext_sales_price * ws.ws_quantity 
                     ELSE 0 
                   END)  AS mar_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 4 THEN ws.ws_ext_sales_price * ws.ws_quantity 
                     ELSE 0 
                   END)  AS apr_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 5 THEN ws.ws_ext_sales_price * ws.ws_quantity 
                     ELSE 0 
                   END)  AS may_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 6 THEN ws.ws_ext_sales_price * ws.ws_quantity 
                     ELSE 0 
                   END)  AS jun_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 7 THEN ws.ws_ext_sales_price * ws.ws_quantity 
                     ELSE 0 
                   END)  AS jul_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 8 THEN ws.ws_ext_sales_price * ws.ws_quantity 
                     ELSE 0 
                   END)  AS aug_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 9 THEN ws.ws_ext_sales_price * ws.ws_quantity 
                     ELSE 0 
                   END)  AS sep_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 10 THEN ws.ws_ext_sales_price * ws.ws_quantity 
                     ELSE 0 
                   END)  AS oct_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 11 THEN ws.ws_ext_sales_price * ws.ws_quantity 
                     ELSE 0 
                   END)  AS nov_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 12 THEN ws.ws_ext_sales_price * ws.ws_quantity 
                     ELSE 0 
                   END)  AS dec_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 1 THEN ws.ws_net_paid_inc_ship * ws.ws_quantity 
                     ELSE 0 
                   END)  AS jan_net, 
               Sum(CASE 
                     WHEN d.d_moy = 2 THEN ws.ws_net_paid_inc_ship * ws.ws_quantity 
                     ELSE 0 
                   END)  AS feb_net, 
               Sum(CASE 
                     WHEN d.d_moy = 3 THEN ws.ws_net_paid_inc_ship * ws.ws_quantity 
                     ELSE 0 
                   END)  AS mar_net, 
               Sum(CASE 
                     WHEN d.d_moy = 4 THEN ws.ws_net_paid_inc_ship * ws.ws_quantity 
                     ELSE 0 
                   END)  AS apr_net, 
               Sum(CASE 
                     WHEN d.d_moy = 5 THEN ws.ws_net_paid_inc_ship * ws.ws_quantity 
                     ELSE 0 
                   END)  AS may_net, 
               Sum(CASE 
                     WHEN d.d_moy = 6 THEN ws.ws_net_paid_inc_ship * ws.ws_quantity 
                     ELSE 0 
                   END)  AS jun_net, 
               Sum(CASE 
                     WHEN d.d_moy = 7 THEN ws.ws_net_paid_inc_ship * ws.ws_quantity 
                     ELSE 0 
                   END)  AS jul_net, 
               Sum(CASE 
                     WHEN d.d_moy = 8 THEN ws.ws_net_paid_inc_ship * ws.ws_quantity 
                     ELSE 0 
                   END)  AS aug_net, 
               Sum(CASE 
                     WHEN d.d_moy = 9 THEN ws.ws_net_paid_inc_ship * ws.ws_quantity 
                     ELSE 0 
                   END)  AS sep_net, 
               Sum(CASE 
                     WHEN d.d_moy = 10 THEN ws.ws_net_paid_inc_ship * ws.ws_quantity 
                     ELSE 0 
                   END)  AS oct_net, 
               Sum(CASE 
                     WHEN d.d_moy = 11 THEN ws.ws_net_paid_inc_ship * ws.ws_quantity 
                     ELSE 0 
                   END)  AS nov_net, 
               Sum(CASE 
                     WHEN d.d_moy = 12 THEN ws.ws_net_paid_inc_ship * ws.ws_quantity 
                     ELSE 0 
                   END)  AS dec_net 
        FROM   web_sales ws, 
               warehouse w, 
               date_dim d, 
               time_dim t, 
               ship_mode sm
        WHERE  ws.ws_warehouse_sk = w.w_warehouse_sk 
               AND ws.ws_sold_date_sk = d.d_date_sk 
               AND ws.ws_sold_time_sk = t.t_time_sk 
               AND ws.ws_ship_mode_sk = sm.sm_ship_mode_sk 
               AND d.d_year = 1998 
               AND t.t_time BETWEEN 7249 AND 7249 + 28800 
               AND sm.sm_carrier IN ( 'ZOUROS', 'ZHOU' ) 
        GROUP  BY w.w_warehouse_name, 
                  w.w_warehouse_sq_ft, 
                  w.w_city, 
                  w.w_county, 
                  w.w_state, 
                  w.w_country, 
                  d.d_year 
        UNION ALL 
        SELECT w.w_warehouse_name, 
               w.w_warehouse_sq_ft, 
               w.w_city, 
               w.w_county, 
               w.w_state, 
               w.w_country, 
               'ZOUROS' 
               || ',' 
               || 'ZHOU' AS ship_carriers, 
               d.d_year    AS year1, 
               Sum(CASE 
                     WHEN d.d_moy = 1 THEN cs.cs_ext_sales_price * cs.cs_quantity 
                     ELSE 0 
                   END)  AS jan_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 2 THEN cs.cs_ext_sales_price * cs.cs_quantity 
                     ELSE 0 
                   END)  AS feb_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 3 THEN cs.cs_ext_sales_price * cs.cs_quantity 
                     ELSE 0 
                   END)  AS mar_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 4 THEN cs.cs_ext_sales_price * cs.cs_quantity 
                     ELSE 0 
                   END)  AS apr_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 5 THEN cs.cs_ext_sales_price * cs.cs_quantity 
                     ELSE 0 
                   END)  AS may_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 6 THEN cs.cs_ext_sales_price * cs.cs_quantity 
                     ELSE 0 
                   END)  AS jun_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 7 THEN cs.cs_ext_sales_price * cs.cs_quantity 
                     ELSE 0 
                   END)  AS jul_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 8 THEN cs.cs_ext_sales_price * cs.cs_quantity 
                     ELSE 0 
                   END)  AS aug_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 9 THEN cs.cs_ext_sales_price * cs.cs_quantity 
                     ELSE 0 
                   END)  AS sep_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 10 THEN cs.cs_ext_sales_price * cs.cs_quantity 
                     ELSE 0 
                   END)  AS oct_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 11 THEN cs.cs_ext_sales_price * cs.cs_quantity 
                     ELSE 0 
                   END)  AS nov_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 12 THEN cs.cs_ext_sales_price * cs.cs_quantity 
                     ELSE 0 
                   END)  AS dec_sales, 
               Sum(CASE 
                     WHEN d.d_moy = 1 THEN cs.cs_net_paid * cs.cs_quantity 
                     ELSE 0 
                   END)  AS jan_net, 
               Sum(CASE 
                     WHEN d.d_moy = 2 THEN cs.cs_net_paid * cs.cs_quantity 
                     ELSE 0 
                   END)  AS feb_net, 
               Sum(CASE 
                     WHEN d.d_moy = 3 THEN cs.cs_net_paid * cs.cs_quantity 
                     ELSE 0 
                   END)  AS mar_net, 
               Sum(CASE 
                     WHEN d.d_moy = 4 THEN cs.cs_net_paid * cs.cs_quantity 
                     ELSE 0 
                   END)  AS apr_net, 
               Sum(CASE 
                     WHEN d.d_moy = 5 THEN cs.cs_net_paid * cs.cs_quantity 
                     ELSE 0 
                   END)  AS may_net, 
               Sum(CASE 
                     WHEN d.d_moy = 6 THEN cs.cs_net_paid * cs.cs_quantity 
                     ELSE 0 
                   END)  AS jun_net, 
               Sum(CASE 
                     WHEN d.d_moy = 7 THEN cs.cs_net_paid * cs.cs_quantity 
                     ELSE 0 
                   END)  AS jul_net, 
               Sum(CASE 
                     WHEN d.d_moy = 8 THEN cs.cs_net_paid * cs.cs_quantity 
                     ELSE 0 
                   END)  AS aug_net, 
               Sum(CASE 
                     WHEN d.d_moy = 9 THEN cs.cs_net_paid * cs.cs_quantity 
                     ELSE 0 
                   END)  AS sep_net, 
               Sum(CASE 
                     WHEN d.d_moy = 10 THEN cs.cs_net_paid * cs.cs_quantity 
                     ELSE 0 
                   END)  AS oct_net, 
               Sum(CASE 
                     WHEN d.d_moy = 11 THEN cs.cs_net_paid * cs.cs_quantity 
                     ELSE 0 
                   END)  AS nov_net, 
               Sum(CASE 
                     WHEN d.d_moy = 12 THEN cs.cs_net_paid * cs.cs_quantity 
                     ELSE 0 
                   END)  AS dec_net 
        FROM   catalog_sales cs, 
               warehouse w, 
               date_dim d, 
               time_dim t, 
               ship_mode sm
        WHERE  cs.cs_warehouse_sk = w.w_warehouse_sk 
               AND cs.cs_sold_date_sk = d.d_date_sk 
               AND cs.cs_sold_time_sk = t.t_time_sk 
               AND cs.cs_ship_mode_sk = sm.sm_ship_mode_sk 
               AND d.d_year = 1998 
               AND t.t_time BETWEEN 7249 AND 7249 + 28800 
               AND sm.sm_carrier IN ( 'ZOUROS', 'ZHOU' ) 
        GROUP  BY w.w_warehouse_name, 
                  w.w_warehouse_sq_ft, 
                  w.w_city, 
                  w.w_county, 
                  w.w_state, 
                  w.w_country, 
                  d.d_year) x 
GROUP  BY x.w_warehouse_name, 
          x.w_warehouse_sq_ft, 
          x.w_city, 
          x.w_county, 
          x.w_state, 
          x.w_country, 
          x.ship_carriers, 
          x.year1 
ORDER  BY x.w_warehouse_name
LIMIT 100; 
