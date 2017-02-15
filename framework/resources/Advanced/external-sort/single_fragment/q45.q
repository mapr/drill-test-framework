ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.width.max_per_node` = 1;
alter session set `planner.disable_exchanges` = true;
alter session set `planner.width.max_per_query` = 1;
alter session set `planner.memory.max_query_memory_per_node` = 552428800;
alter session set `planner.enable_decimal_data_type` = true;
select count(*) from (
  select * from (
    select 
      d.map map,
      d.map.missing1 missing1, 
      'hello' as missing2, 
      true as missing3, 
      5.888 as missing4, 
      cast('abcd' as varchar) missing5, 
      cast('1998-01-01' as date) missing6, 
      cast(1.1 as decimal(28,2)) missing7, 
      CAST(456 as CHAR(3)) missing8, 
      cast('P1Y' as interval year) missing9, 
      cast('P1D' as interval day) missing10,
      cast('P1Y1M1DT1H1M' as interval second) missing11,
      CONVERT_FROM('{x:100, y:215.6}' ,'JSON') missing12,
      STRING_BINARY(CONVERT_TO(1, 'INT')) missing13,
      STRING_BINARY(CONVERT_TO(1, 'INT_BE')) as missing14,
      STRING_BINARY(CONVERT_TO(1, 'BIGINT')) as missing15,
      STRING_BINARY(CONVERT_TO(1, 'BIGINT')) as missing16,
      STRING_BINARY(CONVERT_TO(1, 'INT_HADOOPV')) as missing17,
      STRING_BINARY(CONVERT_TO('hello', 'UTF8')) as missing18,
      STRING_BINARY(CONVERT_TO('hello', 'UTF16')) missing19,
      CONVERT_FROM(BINARY_STRING('\x00\x00\x00\xC8'), 'INT_BE') AS missing20,
      CONVERT_FROM(BINARY_STRING('\x00\x00\x00\xC8'), 'INT') AS missing21,
      CONVERT_FROM(BINARY_STRING('\xBE\xBA\xFE\xCA'), 'INT_BE') AS missing22,
      CONVERT_TO(-1095041334, 'INT_BE') as missing23,
      TO_CHAR(1256.789383, '#,###.###') missing24,
      TO_CHAR((CAST('2008-2-23' AS DATE)), 'yyyy-MMM-dd') missing25,
      CAST('12:20:30' AS TIME) missing26,
      CAST('2015-2-23 12:00:00' AS TIMESTAMP) missing27,
      TO_DATE('2015-FEB-23', 'yyyy-MMM-dd') missing28,
      EXTRACT(year from mydate) `missing 29`,
      TO_DATE(1427849046000) missing30,
      TO_NUMBER('987,966', '######') missing31,
      TO_TIME('12:20:30', 'HH:mm:ss') missing32,
      TO_TIMESTAMP('2008-2-23 12:00:00', 'yyyy-MM-dd HH:mm:ss') missing33,
      TIMEOFDAY() missing34,
      d.map.missingmap.m1 m1 
    from dfs.`/drill/testdata/resource-manager/nested-large.json` d
  ) d1 
  order by d1.map.missing, d1.missing12.x
) d2 
where d2.missing1 < -1;
alter session set `planner.enable_decimal_data_type` = false;
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.disable_exchanges` = false;
alter session set `planner.width.max_per_query` = 1000;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
