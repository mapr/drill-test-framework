-- star/star lower case customerid in the where clause

select * from ( select * from `customer.json` ) where customerid = 100;
