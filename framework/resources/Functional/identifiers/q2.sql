-- star in subquery, upper case in projection list

select CUSTOMERID, CITYID from ( select * from `customer.json` ) where CUSTOMERID >= 100 order by customerid;
