select stddev(cast(twocf['age'] as integer)) from voter where twocf['age'] > 30;
