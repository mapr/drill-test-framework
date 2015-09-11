select
  i.i_item_desc,
  i.i_category,
  i.i_class,
  i.i_current_price,
  sum(ss.ss_ext_sales_price) as itemrevenue
  -- sum(ss.ss_ext_sales_price) * 100 / sum(sum(ss.ss_ext_sales_price)) over (partition by i.i_class) as revenueratio
from
  store_sales as ss,
  item as i,
  date_dim as d
where
  ss.ss_item_sk = i.i_item_sk
  and i.i_category in ('Jewelry', 'Sports', 'Books')
  and ss.ss_sold_date_sk = d.d_date_sk
  and ss.ss_sold_date_sk between 2451911 and 2451941  -- partition key filter (1 calendar month)
  and d.d_date between cast('2001-01-01' as date) and cast('2001-01-31' as date)
group by
  i.i_item_id,
  i.i_item_desc,
  i.i_category,
  i.i_class,
  i.i_current_price
order by
  i.i_category,
  i.i_class,
  i.i_item_id,
  i.i_item_desc
  -- revenueratio
limit 1000;

