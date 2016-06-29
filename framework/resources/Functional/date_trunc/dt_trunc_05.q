SELECT
      date_trunc('MILLENNIUM', date '2011-2-3') as `m1`,
      date_trunc('MILLENNIUM', date '2000-11-3') as `m2`,
      date_trunc('MILLENNIUM', date '1983-05-18') as `m3`,
      date_trunc('MILLENNIUM', date '990-11-3') as `m4`,
      date_trunc('MILLENNIUM', date '0001-11-3') as `m5`
FROM sys.version;
