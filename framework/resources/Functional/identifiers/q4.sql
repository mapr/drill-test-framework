-- different case of the same column in join
select 	a.CustomerID, b.cityid
from	`customer.json` a,
	`customer.json` b
where	
	a.CUSTOMERID = b.customerID
order by 
	a.customerid;
