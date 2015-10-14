select
  d.d_year,
  i.i_brand_id brand_id,
  i.i_brand brand,
  sum(ss.ss_ext_sales_price) ext_price
from
  date_dim as d,
  store_sales as ss,
  item as i
where
  d.d_date_sk = ss.ss_sold_date_sk
  and ss.ss_item_sk = i.i_item_sk
  and i.i_manager_id = 1
  and d.d_moy = 12
  and d.d_year = 1998
  and ss.ss_sold_date_sk between 2451149 and 2451179 -- added for partition pruning
group by
  d.d_year,
  i.i_brand,
  i.i_brand_id
order by
  d.d_year,
  ext_price desc,
  brand_id
limit 100;

