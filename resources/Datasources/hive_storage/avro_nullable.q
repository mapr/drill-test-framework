DROP TABLE IF EXISTS test_serializer;
CREATE TABLE test_serializer(string1 STRING,
                             int1 INT,
                             tinyint1 TINYINT,
                             smallint1 SMALLINT,
                             bigint1 BIGINT,
                             boolean1 BOOLEAN,
                             float1 FLOAT,
                             double1 DOUBLE,
                             list1 ARRAY<STRING>,
                             map1 MAP<STRING,INT>,
                             struct1 STRUCT<sint:INT,sboolean:BOOLEAN,sstring:STRING>,
                             enum1 STRING,
                             nullableint INT,
                             bytes1 BINARY,
                             fixed1 BINARY)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' COLLECTION ITEMS TERMINATED BY ':' MAP KEYS TERMINATED BY '#' LINES TERMINATED BY '\n'
 STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH 'resources/Datasources/hive_storage/csv.txt' INTO TABLE test_serializer;

DROP TABLE IF EXISTS as_avro;
CREATE TABLE as_avro
  ROW FORMAT
  SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
  STORED AS
  INPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
  OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
  TBLPROPERTIES (
    'avro.schema.literal'='{
      "namespace": "com.howdy",
      "name": "some_schema",
      "type": "record",
      "fields": [
        { "name": "string1", "type": ["null", "string"] },
        { "name": "int1", "type": ["null", "int"] },
        { "name": "tinyint1", "type": ["null", "int"] },
        { "name": "smallint1", "type": ["null", "int"] },
        { "name": "bigint1", "type": ["null", "long"] },
        { "name": "boolean1", "type": ["null", "boolean"] },
        { "name": "float1", "type": ["null", "float"] },
        { "name": "double1", "type": ["null", "double"] },
        { "name": "list1", "type": ["null", {"type": "array", "items": "string"}] },
        { "name": "map1", "type": ["null", {"type": "map", "values": "int"}] },
        { "name": "struct1", "type": ["null", {"type": "record", "name": "struct1_name", "fields": [
          { "name": "sInt", "type": "int" },
          { "name": "sBoolean", "type": "boolean" },
          { "name": "sString", "type": "string" }
        ]}] },
        { "name": "enum1", "type": ["null", {"type": "enum", "name": "enum1_values", "symbols": ["BLUE", "RED", "GREEN"]}] },
        { "name": "nullableint", "type": ["null", "int"] },
        { "name": "bytes1", "type": ["null", "bytes"] },
        { "name": "fixed1", "type": ["null", {"type": "fixed", "name": "threebytes", "size": 3}] }
      ]
    }'
  )
;

INSERT OVERWRITE TABLE as_avro SELECT * FROM test_serializer;


DROP TABLE IF EXISTS as_avro1;
CREATE TABLE as_avro1(string1 STRING,
                     int1 INT,
                     tinyint1 TINYINT,
                     smallint1 SMALLINT,
                     bigint1 BIGINT,
                     boolean1 BOOLEAN,
                     float1 FLOAT,
                     double1 DOUBLE,
                     enum1 STRING,
                     nullableint INT,
                     bytes1 BINARY,
                     fixed1 BINARY)
STORED AS AVRO;
INSERT OVERWRITE TABLE as_avro1 SELECT string1, int1, tinyint1, smallint1, bigint1, boolean1, float1, double1, enum1, nullableInt, encode(string1, 'UTF-8'), encode(string1, 'UTF-8') FROM test_serializer;

