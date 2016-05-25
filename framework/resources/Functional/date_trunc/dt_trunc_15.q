SELECT date_trunc('YEAR', timestamp '1999-05-05 10:11:12.100') as yr,
       date_trunc('MONTH', timestamp '1999-05-05 10:11:12.100') as mnth,
       date_trunc('DAY', timestamp '1999-05-05 10:11:12.100') as dy,
       date_trunc('HOUR', timestamp '1999-05-05 10:11:12.100') as hr,
       date_trunc('MINUTE', timestamp '1999-05-05 10:11:12.100') as minut,
       date_trunc('SECOND', timestamp '1999-05-05 10:11:12.100') as scnd,
       date_trunc('WEEK', timestamp '1999-05-05 10:11:12.100') as wk,
       date_trunc('QUARTER', timestamp '1999-05-05 10:11:12.100') as qtr,
       date_trunc('DECADE', timestamp '1999-05-05 10:11:12.100') as decad,
       date_trunc('CENTURY', timestamp '1999-05-05 10:11:12.100') as century,
       date_trunc('MILLENNIUM', timestamp '1999-05-05 10:11:12.100') as millennium
FROM sys.version;
