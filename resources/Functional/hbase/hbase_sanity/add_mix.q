select cast(twocf['age'] as integer) + cast(threecf['contributions'] as decimal(6,2)) from voter where row_key=10;
