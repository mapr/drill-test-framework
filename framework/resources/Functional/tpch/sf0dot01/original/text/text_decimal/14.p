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
    "@id" : 7,
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
    "columns" : [ "`columns`[0]", "`columns`[4]" ],
    "selectionRoot" : "/drill/testdata/json_storage/part.tbl",
    "cost" : 230.0
  }, {
    "pop" : "project",
    "@id" : 5,
    "exprs" : [ {
      "ref" : "`p_partkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`p_type`",
      "expr" : "`columns`[4]"
    } ],
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 230.0
  }, {
    "pop" : "fs-scan",
    "@id" : 10,
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
    "columns" : [ "`columns`" ],
    "selectionRoot" : "/drill/testdata/json_storage/lineitem.tbl",
    "cost" : 7035.0
  }, {
    "pop" : "filter",
    "@id" : 9,
    "child" : 10,
    "expr" : "booleanAnd(greater_than_or_equal_to(cast( (`columns`[10] ) as DATE ), cast( 775699200000 as DATE)) , less_than(cast( (`columns`[10] ) as DATE ), add(cast( 775699200000 as DATE), cast( 'P1M' as INTERVALYEAR)) ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 8,
    "child" : 9,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "project",
    "@id" : 6,
    "exprs" : [ {
      "ref" : "`l_partkey`",
      "expr" : "cast( (`columns`[1] ) as INT )"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "cast( (`columns`[5] ) as DECIMAL18(15, 2) )"
    }, {
      "ref" : "`l_discount`",
      "expr" : "cast( (`columns`[6] ) as DECIMAL18(15, 2) )"
    } ],
    "child" : 8,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "hash-join",
    "@id" : 4,
    "left" : 6,
    "right" : 5,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_partkey`",
      "right" : "`p_partkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "project",
    "@id" : 3,
    "exprs" : [ {
      "ref" : "`$f0`",
      "expr" : " ( if (like(`p_type`, 'PROMO%')  ) then (multiply(`l_extendedprice`, subtract(1, `l_discount`) )  )  else (0.0 )  end  ) "
    }, {
      "ref" : "`$f1`",
      "expr" : "multiply(`l_extendedprice`, subtract(1, `l_discount`) ) "
    } ],
    "child" : 4,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "streaming-aggregate",
    "@id" : 2,
    "child" : 3,
    "keys" : [ ],
    "exprs" : [ {
      "ref" : "`$f0`",
      "expr" : "sum(`$f0`) "
    }, {
      "ref" : "`$f1`",
      "expr" : "sum(`$f1`) "
    } ],
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`promo_revenue`",
      "expr" : "divide(multiply(100.0, `$f0`) , `$f1`) "
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 175.875
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 175.875
  } ]
}