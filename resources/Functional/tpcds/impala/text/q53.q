select
  *
from
  (select
    i.i_manufact_id as imid,
    sum(ss.ss_sales_price) sum_sales
    -- avg(sum(ss.ss_sales_price)) over (partition by i.i_manufact_id) avg_quarterly_sales
  from
    item as i,
    store_sales as ss,
    date_dim as d,
    store as s
  where
    ss.ss_item_sk = i.i_item_sk
    and ss.ss_sold_date_sk = d.d_date_sk
    and ss.ss_store_sk = s.s_store_sk
    and d.d_month_seq in (1212, 1212 + 1, 1212 + 2, 1212 + 3, 1212 + 4, 1212 + 5, 1212 + 6, 1212 + 7, 1212 + 8, 1212 + 9, 1212 + 10, 1212 + 11)
    and ((i.i_category in ('Books', 'Children', 'Electronics')
      and i.i_class in ('personal', 'portable', 'reference', 'self-help')
      and i.i_brand in ('scholaramalgamalg #14', 'scholaramalgamalg #7', 'exportiunivamalg #9', 'scholaramalgamalg #9'))
    or (i.i_category in ('Women', 'Music', 'Men')
      and i.i_class in ('accessories', 'classical', 'fragrances', 'pants')
      and i.i_brand in ('amalgimporto #1', 'edu packscholar #1', 'exportiimporto #1', 'importoamalg #1')))
    and ss.ss_sold_date_sk between 2451911 and 2452275 -- partition key filter
  group by
    i.i_manufact_id,
    d.d_qoy
  ) tmp1
-- where
--   case when avg_quarterly_sales > 0 then abs (sum_sales - avg_quarterly_sales) / avg_quarterly_sales else null end > 0.1
order by
  -- avg_quarterly_sales,
  sum_sales,
  tmp1.imid
limit 100;

