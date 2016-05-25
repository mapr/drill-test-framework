SELECT
      date_trunc('SECOND', interval '200 10:20:30.123' day(3) to second) as `second`,
      date_trunc('MINUTE', interval '200 10:20:30.123' day(3) to second) as `minute`,
      date_trunc('HOUR', interval '200 10:20:30.123' day(3) to second) as `hour`,
      date_trunc('DAY', interval '200 10:20:30.123' day(3) to second) as `day`,
      date_trunc('MONTH', interval '200 10:20:30.123' day(3) to second) as `month`,
      date_trunc('YEAR', interval '200 10:20:30.123' day(3) to second) as `year`,
      date_trunc('QUARTER', interval '200 10:20:30.123' day(3) to second) as `quarter`,
      date_trunc('DECADE', interval '200 10:20:30.123' day(3) to second) as `decade`,
      date_trunc('CENTURY', interval '200 10:20:30.123' day(3) to second) as `century`,
      date_trunc('MILLENNIUM', interval '200 10:20:30.123' day(3) to second) as `millennium`
FROM sys.version;
