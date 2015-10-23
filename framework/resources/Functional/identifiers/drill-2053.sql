with a as ( select * from `customer.json` ) select * from a, `customer.json` b where a.CUSTOMERID = b.customerid;
