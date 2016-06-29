SELECT
      date_trunc('SECOND', timestamp '2011-2-3 10:11:12.100') as `second`,
      date_trunc('MINUTE', timestamp '2011-2-3 10:11:12.100') as `minute`,
      date_trunc('HOUR', timestamp '2011-2-3 10:11:12.100') as `hour`,
      date_trunc('DAY', timestamp '2011-2-3 10:11:12.100') as `day`,
      date_trunc('WEEK', timestamp '2011-2-3 10:11:12.100') as `week`,
      date_trunc('MONTH', timestamp '2011-2-3 10:11:12.100') as `month`,
      date_trunc('YEAR', timestamp '2011-2-3 10:11:12.100') as `year`,
      date_trunc('QUARTER', timestamp '2011-5-3 10:11:12.100') as `q1`,
      date_trunc('QUARTER', timestamp '2011-7-13 10:11:12.100') as `q2`,
      date_trunc('QUARTER', timestamp '2011-9-13 10:11:12.100') as `q3`,
      date_trunc('DECADE', timestamp '2011-2-3 10:11:12.100') as `decade1`,
      date_trunc('DECADE', timestamp '2072-2-3 10:11:12.100') as `decade2`,
      date_trunc('DECADE', timestamp '1978-2-3 10:11:12.100') as `decade3`
FROM sys.version;
