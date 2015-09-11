select
c.c_last_name,
c.c_first_name,
ca.ca_city,
dn.bought_city,
dn.sstn,
dn.extended_price,
dn.extended_tax,
dn.list_price
from
(select
ss.ss_ticket_number as sstn,
ss.ss_customer_sk as sscsk,
ca.ca_city bought_city,
sum(ss.ss_ext_sales_price) extended_price,
sum(ss.ss_ext_list_price) list_price,
sum(ss.ss_ext_tax) extended_tax
from
store_sales as ss,
date_dim as d,
store as s,
household_demographics as hd,
customer_address as ca
where
ss.ss_sold_date_sk = d.d_date_sk
and ss.ss_store_sk = s.s_store_sk
and ss.ss_hdemo_sk = hd.hd_demo_sk
and ss.ss_addr_sk = ca.ca_address_sk
-- and d.d_dom between 1 and 2
and (hd.hd_dep_count = 5
or hd.hd_vehicle_count = 3)
-- and d.d_year in (1999, 1999 + 1, 1999 + 2)
and s.s_city in ('Midway', 'Fairview')
-- partition key filter
-- and ss.ss_sold_date_sk in (2451180, 2451181, 2451211, 2451212, 2451239, 2451240, 2451270, 2451271, 2451300, 2451301, 2451331, 
--                         2451332, 2451361, 2451362, 2451392, 2451393, 2451423, 2451424, 2451453, 2451454, 2451484, 2451485, 
--                         2451514, 2451515, 2451545, 2451546, 2451576, 2451577, 2451605, 2451606, 2451636, 2451637, 2451666, 
--                         2451667, 2451697, 2451698, 2451727, 2451728, 2451758, 2451759, 2451789, 2451790, 2451819, 2451820, 
--                         2451850, 2451851, 2451880, 2451881, 2451911, 2451912, 2451942, 2451943, 2451970, 2451971, 2452001, 
--                         2452002, 2452031, 2452032, 2452062, 2452063, 2452092, 2452093, 2452123, 2452124, 2452154, 2452155, 
--                         2452184, 2452185, 2452215, 2452216, 2452245, 2452246) 
and ss.ss_sold_date_sk between 2451180 and 2451269 -- partition key filter (3 months)
and d.d_date between cast('1999-01-01' as date) and cast('1999-03-31' as date)
group by
ss.ss_ticket_number,
ss.ss_customer_sk,
ss.ss_addr_sk,
ca.ca_city
) dn,
customer as c,
customer_address as ca
where
dn.sscsk = c.c_customer_sk
and c.c_current_addr_sk = ca.ca_address_sk
and ca.ca_city <> dn.bought_city
order by
c.c_last_name,
dn.sstn

limit 100;

