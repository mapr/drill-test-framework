{
  "head" : {
    "version" : 1,
    "generator" : {
      "type" : "ExplainHandler",
      "info" : ""
    },
    "type" : "APACHE_DRILL_PHYSICAL",
    "options" : [ ],
    "queue" : 0,
    "resultMode" : "EXEC"
  },
  "graph" : [ {
    "pop" : "fs-scan",
    "@id" : 9,
    "files" : [ "maprfs:/drill/testdata/json_storage/lineitem.tbl" ],
    "storage" : {
      "type" : "file",
      "enabled" : true,
      "connection" : "maprfs:///",
      "workspaces" : {
        "root" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "tmp" : {
          "location" : "/tmp",
          "writable" : true,
          "storageformat" : "csv"
        },
        "drillTestDir" : {
          "location" : "/drill/testdata/",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirAmplab" : {
          "location" : "/drill/testdata/amplab",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirP1" : {
          "location" : "/drill/testdata/p1tests",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirStress" : {
          "location" : "/drill/testdata/stress",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirExchanges" : {
          "location" : "/drill/testdata/exchanges_test",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirExplicit" : {
          "location" : "/drill/testdata/explicit_cast",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirInformationSchema" : {
          "location" : "/drill/testdata/information_schema",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirInformationSchemaHbase" : {
          "location" : "/drill/testdata/information_schema",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirViews" : {
          "location" : "/drill/testdata/views",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirJson" : {
          "location" : "/drill/testdata/json_storage",
          "writable" : true,
          "storageformat" : "json"
        },
        "drillTestDirText" : {
          "location" : "/drill/testdata/text",
          "writable" : true,
          "storageformat" : "text"
        },
        "drillTestDirUdfs" : {
          "location" : "/drill/testdata/udfs",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirDatetime" : {
          "location" : "/drill/testdata/datetime/datasources/",
          "writable" : true,
          "storageformat" : "parquet"
        }
      },
      "formats" : {
        "psv" : {
          "type" : "text",
          "extensions" : [ "tbl" ],
          "delimiter" : "|"
        },
        "csv" : {
          "type" : "text",
          "extensions" : [ "csv" ],
          "delimiter" : ","
        },
        "tsv" : {
          "type" : "text",
          "extensions" : [ "tsv" ],
          "delimiter" : "\t"
        },
        "parquet" : {
          "type" : "parquet"
        },
        "json" : {
          "type" : "json"
        }
      }
    },
    "format" : {
      "type" : "text",
      "extensions" : [ "tbl" ],
      "delimiter" : "|"
    },
    "columns" : [ "`columns`[1]", "`columns`[4]", "`columns`[5]", "`columns`[6]", "`columns`[13]", "`columns`[14]" ],
    "selectionRoot" : "/drill/testdata/json_storage/lineitem.tbl",
    "cost" : 7035.0
  }, {
    "pop" : "project",
    "@id" : 7,
    "exprs" : [ {
      "ref" : "`l_partkey`",
      "expr" : "cast( (`columns`[1] ) as INT )"
    }, {
      "ref" : "`l_quantity`",
      "expr" : "cast( (`columns`[4] ) as FLOAT8 )"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "cast( (`columns`[5] ) as FLOAT8 )"
    }, {
      "ref" : "`l_discount`",
      "expr" : "cast( (`columns`[6] ) as FLOAT8 )"
    }, {
      "ref" : "`l_shipinstruct`",
      "expr" : "`columns`[13]"
    }, {
      "ref" : "`l_shipmode`",
      "expr" : "`columns`[14]"
    } ],
    "child" : 9,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7035.0
  }, {
    "pop" : "fs-scan",
    "@id" : 8,
    "files" : [ "maprfs:/drill/testdata/json_storage/part.tbl" ],
    "storage" : {
      "type" : "file",
      "enabled" : true,
      "connection" : "maprfs:///",
      "workspaces" : {
        "root" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "tmp" : {
          "location" : "/tmp",
          "writable" : true,
          "storageformat" : "csv"
        },
        "drillTestDir" : {
          "location" : "/drill/testdata/",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirAmplab" : {
          "location" : "/drill/testdata/amplab",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirP1" : {
          "location" : "/drill/testdata/p1tests",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirStress" : {
          "location" : "/drill/testdata/stress",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirExchanges" : {
          "location" : "/drill/testdata/exchanges_test",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirExplicit" : {
          "location" : "/drill/testdata/explicit_cast",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirInformationSchema" : {
          "location" : "/drill/testdata/information_schema",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirInformationSchemaHbase" : {
          "location" : "/drill/testdata/information_schema",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirViews" : {
          "location" : "/drill/testdata/views",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirJson" : {
          "location" : "/drill/testdata/json_storage",
          "writable" : true,
          "storageformat" : "json"
        },
        "drillTestDirText" : {
          "location" : "/drill/testdata/text",
          "writable" : true,
          "storageformat" : "text"
        },
        "drillTestDirUdfs" : {
          "location" : "/drill/testdata/udfs",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirDatetime" : {
          "location" : "/drill/testdata/datetime/datasources/",
          "writable" : true,
          "storageformat" : "parquet"
        }
      },
      "formats" : {
        "psv" : {
          "type" : "text",
          "extensions" : [ "tbl" ],
          "delimiter" : "|"
        },
        "csv" : {
          "type" : "text",
          "extensions" : [ "csv" ],
          "delimiter" : ","
        },
        "tsv" : {
          "type" : "text",
          "extensions" : [ "tsv" ],
          "delimiter" : "\t"
        },
        "parquet" : {
          "type" : "parquet"
        },
        "json" : {
          "type" : "json"
        }
      }
    },
    "format" : {
      "type" : "text",
      "extensions" : [ "tbl" ],
      "delimiter" : "|"
    },
    "columns" : [ "`columns`[0]", "`columns`[3]", "`columns`[5]", "`columns`[6]" ],
    "selectionRoot" : "/drill/testdata/json_storage/part.tbl",
    "cost" : 230.0
  }, {
    "pop" : "project",
    "@id" : 6,
    "exprs" : [ {
      "ref" : "`p_partkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`p_brand`",
      "expr" : "`columns`[3]"
    }, {
      "ref" : "`p_size`",
      "expr" : "cast( (`columns`[5] ) as INT )"
    }, {
      "ref" : "`p_container`",
      "expr" : "`columns`[6]"
    } ],
    "child" : 8,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 230.0
  }, {
    "pop" : "hash-join",
    "@id" : 5,
    "left" : 7,
    "right" : 6,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_partkey`",
      "right" : "`p_partkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 7035.0
  }, {
    "pop" : "filter",
    "@id" : 4,
    "child" : 5,
    "expr" : "booleanOr(booleanAnd(equal(cast( (`p_brand` ) as VARCHAR(8) ), 'Brand#41') , booleanOr(equal(`p_container`, 'SM CASE') , equal(`p_container`, 'SM BOX') , equal(`p_container`, 'SM PACK') , equal(`p_container`, 'SM PKG') ) , greater_than_or_equal_to(`l_quantity`, 2) , less_than_or_equal_to(`l_quantity`, add(2, 10) ) , greater_than_or_equal_to(`p_size`, 1) , less_than_or_equal_to(`p_size`, 5) , booleanOr(equal(`l_shipmode`, 'AIR') , equal(`l_shipmode`, 'AIR REG') ) , equal(cast( (`l_shipinstruct` ) as VARCHAR(17) ), 'DELIVER IN PERSON') ) , booleanAnd(equal(cast( (`p_brand` ) as VARCHAR(8) ), 'Brand#13') , booleanOr(equal(`p_container`, 'MED BAG') , equal(`p_container`, 'MED BOX') , equal(`p_container`, 'MED PKG') , equal(`p_container`, 'MED PACK') ) , greater_than_or_equal_to(`l_quantity`, 14) , less_than_or_equal_to(`l_quantity`, add(14, 10) ) , greater_than_or_equal_to(`p_size`, 1) , less_than_or_equal_to(`p_size`, 10) , booleanOr(equal(`l_shipmode`, 'AIR') , equal(`l_shipmode`, 'AIR REG') ) , equal(cast( (`l_shipinstruct` ) as VARCHAR(17) ), 'DELIVER IN PERSON') ) , booleanAnd(equal(cast( (`p_brand` ) as VARCHAR(8) ), 'Brand#55') , booleanOr(equal(`p_container`, 'LG CASE') , equal(`p_container`, 'LG BOX') , equal(`p_container`, 'LG PACK') , equal(`p_container`, 'LG PKG') ) , greater_than_or_equal_to(`l_quantity`, 23) , less_than_or_equal_to(`l_quantity`, add(23, 10) ) , greater_than_or_equal_to(`p_size`, 1) , less_than_or_equal_to(`p_size`, 15) , booleanOr(equal(`l_shipmode`, 'AIR') , equal(`l_shipmode`, 'AIR REG') ) , equal(cast( (`l_shipinstruct` ) as VARCHAR(17) ), 'DELIVER IN PERSON') ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 3,
    "child" : 4,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "project",
    "@id" : 2,
    "exprs" : [ {
      "ref" : "`$f0`",
      "expr" : "multiply(`l_extendedprice`, subtract(1, `l_discount`) ) "
    } ],
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "streaming-aggregate",
    "@id" : 1,
    "child" : 2,
    "keys" : [ ],
    "exprs" : [ {
      "ref" : "`revenue`",
      "expr" : "sum(`$f0`) "
    } ],
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 175.875
  } ]
}