SELECT
      date_trunc('MILLENNIUM', timestamp '2011-2-3 10:11:12.100') as `m1`,
      date_trunc('MILLENNIUM', timestamp '2000-11-3 10:11:12.100') as `m2`,
      date_trunc('MILLENNIUM', timestamp '1983-05-18 10:11:12.100') as `m3`,
      date_trunc('MILLENNIUM', timestamp '990-11-3 10:11:12.100') as `m4`,
      date_trunc('MILLENNIUM', timestamp '0001-11-3 10:11:12.100') as `m5`
FROM sys.version;
