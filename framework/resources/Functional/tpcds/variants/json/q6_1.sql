-- /*q6 tpcds equivalent*/
SELECT
        c.c_birth_country,
        (case when mod(s.ss_promo_sk, 8) = 0 then 'Super hot deal'
              when mod(s.ss_promo_sk, 8) = 1 then 'warm hot deal'
              when mod(s.ss_promo_sk, 8) = 2  OR mod(s.ss_promo_sk, 8) = 3 then 'Warm deal'
              when mod(s.ss_promo_sk, 8) = 4 then 'Not a deal at all'
              when mod(s.ss_promo_sk, 8) = 5 then 'Steal'
              when mod(s.ss_promo_sk, 8) = 6 then 'Big steal'
              else 'Other' end) as Promotion,
        sum(case when s.ss_quantity between 1 AND 20 then s.ss_wholesale_cost else 0 end) as wholesale,
        sum(case when s.ss_quantity between 21 AND 40 then s.ss_list_price else 0 end) as  listprice,
        sum(case when s.ss_quantity BETWEEN 41 AND 60 then s.ss_sales_price else 0 end) as _salesprice,
        sum(case when s.ss_quantity BETWEEN 61 AND 81 then s.ss_net_paid else 0 end) as  _netpaid
   FROM
        store_sales s
   JOIN
        customer c
     ON
        s.ss_customer_sk = c.c_customer_sk
  WHERE
        s.ss_promo_sk between 100 and 300
        and s.ss_quantity between 1 AND 99
        and s.ss_store_sk IN (10, 2, 8, 7, 1)
GROUP BY
        c.c_birth_country,
        (case when mod(s.ss_promo_sk, 8) = 0 then 'Super hot deal'
                      when mod(s.ss_promo_sk, 8) = 1 then 'warm hot deal'
                      when mod(s.ss_promo_sk, 8) = 2  OR mod(s.ss_promo_sk, 8) = 3 then 'Warm deal'
                      when mod(s.ss_promo_sk, 8) = 4 then 'Not a deal at all'
                      when mod(s.ss_promo_sk, 8) = 5 then 'Steal'
                      when mod(s.ss_promo_sk, 8) = 6 then 'Big steal'
                      else 'Other' end)
Order by c.c_birth_country, Promotion;  
