SELECT
      date_trunc('CENTURY', date '2011-2-3') as c1,
      date_trunc('CENTURY', date '2000-2-3') as c2,
      date_trunc('CENTURY', date '1901-11-3') as c3,
      date_trunc('CENTURY', date '900-2-3') as c4,
      date_trunc('CENTURY', date '0001-1-3') as c5
FROM sys.version;
