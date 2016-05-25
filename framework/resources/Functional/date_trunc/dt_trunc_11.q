SELECT
      date_trunc('MINUTE', time '2:30:21.5') as TIME1,
      date_trunc('SECOND', time '2:30:21.5') as TIME2,
      date_trunc('HOUR', timestamp '1991-05-05 10:11:12.100') as TS1,
      date_trunc('SECOND', timestamp '1991-05-05 10:11:12.100') as TS2,
      date_trunc('MONTH', date '2011-2-2') as DATE1,
      date_trunc('YEAR', date '2011-2-2') as DATE2
FROM sys.version;
