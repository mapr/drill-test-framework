select
  s.s_store_name,
  i.i_item_desc,
  sc.revenue,
  i.i_current_price,
  i.i_wholesale_cost,
  i.i_brand
from
  store as s,
  item as i,
  (select
    sa.sssk,
    avg(sa.revenue) as ave
  from
    (select
      ss1.ss_store_sk as sssk,
      ss1.ss_item_sk as ssik,
      sum(ss1.ss_sales_price) as revenue
    from
      store_sales as ss1,
      date_dim as d
    where
      ss1.ss_sold_date_sk = d.d_date_sk
      and d.d_month_seq between 1212 and 1212 + 11
      and ss1.ss_sold_date_sk between 2451911 and 2452275  -- partition key filter
    group by
      ss1.ss_store_sk,
      ss1.ss_item_sk
    ) sa
  group by
    sa.sssk
  ) sb,
  (select
    ss2.ss_store_sk as sssk,
    ss2.ss_item_sk as ssik,
    sum(ss2.ss_sales_price) as revenue
  from
    store_sales as ss2,
    date_dim as d
  where
    ss2.ss_sold_date_sk = d.d_date_sk
    and d.d_month_seq between 1212 and 1212 + 11
    and ss2.ss_sold_date_sk between 2451911 and 2452275  -- partition key filter
  group by
    ss2.ss_store_sk,
    ss2.ss_item_sk
  ) sc
where
  sb.sssk = sc.sssk
  and sc.revenue <= 0.1 * sb.ave
  and s.s_store_sk = sc.sssk
  and i.i_item_sk = sc.ssik
order by
  s.s_store_name,
  i.i_item_desc
limit 100;

