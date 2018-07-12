SELECT
  id_int,
  sqlTypeOf(id_int),
  dec_9_0,
  sqlTypeOf(dec_9_0),
  dec_9_1,
  sqlTypeOf(dec_9_1),
  dec_9_4,
  sqlTypeOf(dec_9_4),
  dec_9_4_with_null,
  sqlTypeOf(dec_9_4_with_null),
  dec_9_4_without_null,
  sqlTypeOf(dec_9_4_without_null),
  dec_9_8,
  sqlTypeOf(dec_9_8)
FROM dfs.drillTestDir.`decimal/DRILL_6094/decimal_9_fixed.avro`;