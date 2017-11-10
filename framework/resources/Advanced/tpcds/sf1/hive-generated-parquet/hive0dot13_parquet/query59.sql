-- start query 59 in stream 0 using template query59.tpl 
WITH wss 
     AS (SELECT d.d_week_seq, 
                ss.ss_store_sk, 
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
         FROM   store_sales ss, 
                date_dim d
         WHERE  d.d_date_sk = ss.ss_sold_date_sk 
         GROUP  BY d.d_week_seq, 
                   ss.ss_store_sk) 
SELECT s_store_name1, 
               s_store_id1, 
               d_week_seq1, 
               sun_sales1 / sun_sales2, 
               mon_sales1 / mon_sales2, 
               tue_sales1 / tue_sales2, 
               wed_sales1 / wed_sales2, 
               thu_sales1 / thu_sales2, 
               fri_sales1 / fri_sales2, 
               sat_sales1 / sat_sales2 
FROM   (SELECT s.s_store_name   s_store_name1, 
               wss.d_week_seq d_week_seq1, 
               s.s_store_id     s_store_id1, 
               wss.sun_sales      sun_sales1, 
               wss.mon_sales      mon_sales1, 
               wss.tue_sales      tue_sales1, 
               wss.wed_sales      wed_sales1, 
               wss.thu_sales      thu_sales1, 
               wss.fri_sales      fri_sales1, 
               wss.sat_sales      sat_sales1 
        FROM   wss, 
               store s, 
               date_dim d 
        WHERE  d.d_week_seq = wss.d_week_seq 
               AND wss.ss_store_sk = s.s_store_sk 
               AND d.d_month_seq BETWEEN 1196 AND 1196 + 11) y, 
       (SELECT s.s_store_name   s_store_name2, 
               wss.d_week_seq d_week_seq2, 
               s.s_store_id     s_store_id2, 
               wss.sun_sales      sun_sales2, 
               wss.mon_sales      mon_sales2, 
               wss.tue_sales      tue_sales2, 
               wss.wed_sales      wed_sales2, 
               wss.thu_sales      thu_sales2, 
               wss.fri_sales      fri_sales2, 
               wss.sat_sales      sat_sales2 
        FROM   wss, 
               store s, 
               date_dim d 
        WHERE  d.d_week_seq = wss.d_week_seq 
               AND wss.ss_store_sk = s.s_store_sk 
               AND d.d_month_seq BETWEEN 1196 + 12 AND 1196 + 23) x 
WHERE  s_store_id1 = s_store_id2 
       AND d_week_seq1 = d_week_seq2 - 52 
ORDER  BY s_store_name1, 
          s_store_id1, 
          d_week_seq1
LIMIT 100; 
