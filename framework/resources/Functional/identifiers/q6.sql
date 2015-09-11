-- cityid is coming from two tables, use different case than in the file
select 	cust_id, 
	count(Cust_Id)
from
	(
	select * 
	from 
		(
		select 	a.CustomerID, 
			b.NAME
		from	`customer.json` a,
			`city.json` b
		where	
			a.cityid = b.CITYID
		order by 
			a.customerid
		) as dt(cust_id, name)
	)
group by 
	cust_id
having 
	count(cust_id) = 1
order by
	CUST_ID;
