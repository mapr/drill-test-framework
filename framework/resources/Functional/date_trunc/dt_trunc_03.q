SELECT
      date_trunc('SECOND', date '2014-2-3') as `second`,
      date_trunc('MINUTE', date '2001-2-3') as `minute`,
      date_trunc('HOUR', date '2000-2-3') as `hour`,
      date_trunc('DAY', date '1947-2-3') as `day`,
      date_trunc('WEEK', date '2015-2-3') as `week`,
      date_trunc('MONTH', date '2006-2-3') as `month`,
      date_trunc('YEAR', date '2009-2-3') as `year`,
      date_trunc('QUARTER', date '2001-9-3') as `q1`,
      date_trunc('QUARTER', date '2004-10-13') as `q2`,
      date_trunc('QUARTER', date '2011-6-30') as `q3`,
      date_trunc('DECADE', date '2011-2-3') as `decade1`,
      date_trunc('DECADE', date '2072-2-3') as `decade2`,
      date_trunc('DECADE', date '1978-2-3') as `decade3`
FROM sys.version;
