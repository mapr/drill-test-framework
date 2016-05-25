SELECT
      date_trunc('SECOND', interval '217-7' year(3) to month) as `second`,
      date_trunc('MINUTE', interval '217-7' year(3) to month) as `minute`,
      date_trunc('HOUR', interval '217-7' year(3) to month) as `hour`,
      date_trunc('DAY', interval '217-7' year(3) to month) as `day`,
      date_trunc('MONTH', interval '217-7' year(3) to month) as `month`,
      date_trunc('YEAR', interval '217-7' year(3) to month) as `year`,
      date_trunc('QUARTER', interval '217-7' year(3) to month) as `quarter`,
      date_trunc('DECADE', interval '217-7' year(3) to month) as `decade`,
      date_trunc('CENTURY', interval '217-7' year(3) to month) as `century`,
      date_trunc('MILLENNIUM', interval '217-7' year(3) to month) as `millennium`
FROM sys.version;
