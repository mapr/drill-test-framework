select
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
  and i.i_manager_id = 36
  and d.d_moy = 12
  and d.d_year = 2001
  and ss.ss_sold_date_sk between 2452245 and 2452275 -- partition key filter
group by
  i.i_brand,
  i.i_brand_id
order by
  ext_price desc,
  i.i_brand_id
limit 100 ;

