-- start query 43 in stream 0 using template query43.tpl 
SELECT s.s_store_name, 
               s.s_store_id, 
               Sum(CASE 
                     WHEN ( d.d_day_name = 'Sunday' ) THEN ss.ss_sales_price 
                     ELSE NULL 
                   END) sun_sales, 
               Sum(CASE 
                     WHEN ( d.d_day_name = 'Monday' ) THEN ss.ss_sales_price 
                     ELSE NULL 
                   END) mon_sales, 
               Sum(CASE 
                     WHEN ( d.d_day_name = 'Tuesday' ) THEN ss.ss_sales_price 
                     ELSE NULL 
                   END) tue_sales, 
               Sum(CASE 
                     WHEN ( d.d_day_name = 'Wednesday' ) THEN ss.ss_sales_price 
                     ELSE NULL 
                   END) wed_sales, 
               Sum(CASE 
                     WHEN ( d.d_day_name = 'Thursday' ) THEN ss.ss_sales_price 
                     ELSE NULL 
                   END) thu_sales, 
               Sum(CASE 
                     WHEN ( d.d_day_name = 'Friday' ) THEN ss.ss_sales_price 
                     ELSE NULL 
                   END) fri_sales, 
               Sum(CASE 
                     WHEN ( d.d_day_name = 'Saturday' ) THEN ss.ss_sales_price 
                     ELSE NULL 
                   END) sat_sales 
FROM   date_dim d, 
       store_sales ss, 
       store s
WHERE  d.d_date_sk = ss.ss_sold_date_sk 
       AND s.s_store_sk = ss.ss_store_sk 
       AND s.s_gmt_offset = -5 
       AND d.d_year = 2002 
GROUP  BY s.s_store_name, 
          s.s_store_id 
ORDER  BY s.s_store_name, 
          s.s_store_id, 
          sun_sales, 
          mon_sales, 
          tue_sales, 
          wed_sales, 
          thu_sales, 
          fri_sales, 
          sat_sales
LIMIT 100; 
