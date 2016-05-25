SELECT
      date_trunc('CENTURY', timestamp '2011-2-3 10:11:12.100') as c1,
      date_trunc('CENTURY', timestamp '2000-2-3 10:11:12.100') as c2,
      date_trunc('CENTURY', timestamp '1901-11-3 10:11:12.100') as c3,
      date_trunc('CENTURY', timestamp '900-2-3 10:11:12.100') as c4,
      date_trunc('CENTURY', timestamp '0001-1-3 10:11:12.100') as c5
FROM sys.version;
