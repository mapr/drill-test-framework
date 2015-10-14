select
  d.d_year,
  i.i_brand_id brand_id,
  i.i_brand brand,
  sum(ss.ss_ext_sales_price) sum_agg
from
  date_dim as d,
  store_sales as ss,
  item as i
where
  d.d_date_sk = ss.ss_sold_date_sk
  and ss.ss_item_sk = i.i_item_sk
  and i.i_manufact_id = 436
  and d.d_moy = 12
  -- partition key filters
  and (ss.ss_sold_date_sk between 2451149 and 2451179
    or ss.ss_sold_date_sk between 2451514 and 2451544
    or ss.ss_sold_date_sk between 2451880 and 2451910
    or ss.ss_sold_date_sk between 2452245 and 2452275
    or ss.ss_sold_date_sk between 2452610 and 2452640)
group by
  d.d_year,
  i.i_brand,
  i.i_brand_id
order by
  d.d_year,
  sum_agg desc,
  brand_id
limit 100;

