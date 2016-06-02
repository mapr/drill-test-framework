SELECT
      date_trunc('SECOND', time '2:30:21.5') as `second`,
      date_trunc('MINUTE', time '2:30:21.5') as `minute`,
      date_trunc('HOUR', time '2:30:21.5') as `hour`,
      date_trunc('DAY', time '2:30:21.5') as `day`,
      date_trunc('MONTH', time '2:30:21.5') as `month`,
      date_trunc('YEAR', time '2:30:21.5') as `year`,
      date_trunc('QUARTER', time '2:30:21.5') as `quarter`,
      date_trunc('DECADE', time '2:30:21.5') as `decade`,
      date_trunc('CENTURY', time '2:30:21.5') as `century`,
      date_trunc('MILLENNIUM', time '2:30:21.5') as `millennium`
FROM sys.version;
