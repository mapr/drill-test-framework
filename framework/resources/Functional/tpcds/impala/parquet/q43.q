select
  s.s_store_name,
  s.s_store_id,
  sum(case when (d.d_day_name = 'Sunday') then ss.ss_sales_price else null end) sun_sales,
  sum(case when (d.d_day_name = 'Monday') then ss.ss_sales_price else null end) mon_sales,
  sum(case when (d.d_day_name = 'Tuesday') then ss.ss_sales_price else null end) tue_sales,
  sum(case when (d.d_day_name = 'Wednesday') then ss.ss_sales_price else null end) wed_sales,
  sum(case when (d.d_day_name = 'Thursday') then ss.ss_sales_price else null end) thu_sales,
  sum(case when (d.d_day_name = 'Friday') then ss.ss_sales_price else null end) fri_sales,
  sum(case when (d.d_day_name = 'Saturday') then ss.ss_sales_price else null end) sat_sales
from
  date_dim as d,
  store_sales as ss,
  store as s
where
  d.d_date_sk = ss.ss_sold_date_sk
  and s.s_store_sk = ss.ss_store_sk
  and s.s_gmt_offset = -5
  and d.d_year = 1998
  and ss.ss_sold_date_sk between 2450816 and 2451179  -- partition key filter
group by
  s.s_store_name,
  s.s_store_id
order by
  s.s_store_name,
  s.s_store_id,
  sun_sales,
  mon_sales,
  tue_sales,
  wed_sales,
  thu_sales,
  fri_sales,
  sat_sales
limit 100;

