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
    "@id" : 17,
    "files" : [ "maprfs:/drill/testdata/json_storage/orders.tbl" ],
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
    "selectionRoot" : "/drill/testdata/json_storage/orders.tbl",
    "cost" : 1605.0
  }, {
    "pop" : "filter",
    "@id" : 14,
    "child" : 17,
    "expr" : "booleanAnd(greater_than_or_equal_to(cast( (`columns`[4] ) as DATE ), cast( 844128000000 as DATE)) , less_than(cast( (`columns`[4] ) as DATE ), add(cast( 844128000000 as DATE), cast( 'P3M' as INTERVALYEAR)) ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 401.25
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 12,
    "child" : 14,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 401.25
  }, {
    "pop" : "project",
    "@id" : 10,
    "exprs" : [ {
      "ref" : "`o_orderkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`o_orderpriority`",
      "expr" : "`columns`[5]"
    } ],
    "child" : 12,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 401.25
  }, {
    "pop" : "fs-scan",
    "@id" : 23,
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
    "@id" : 21,
    "child" : 23,
    "expr" : "less_than(cast( (`columns`[11] ) as DATE ), cast( (`columns`[12] ) as DATE )) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3517.5
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 19,
    "child" : 21,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3517.5
  }, {
    "pop" : "project",
    "@id" : 16,
    "exprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    } ],
    "child" : 19,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3517.5
  }, {
    "pop" : "fs-scan",
    "@id" : 24,
    "files" : [ "maprfs:/drill/testdata/json_storage/orders.tbl" ],
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
    "selectionRoot" : "/drill/testdata/json_storage/orders.tbl",
    "cost" : 1605.0
  }, {
    "pop" : "filter",
    "@id" : 22,
    "child" : 24,
    "expr" : "booleanAnd(greater_than_or_equal_to(cast( (`columns`[4] ) as DATE ), cast( 844128000000 as DATE)) , less_than(cast( (`columns`[4] ) as DATE ), add(cast( 844128000000 as DATE), cast( 'P3M' as INTERVALYEAR)) ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 401.25
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 20,
    "child" : 22,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 401.25
  }, {
    "pop" : "project",
    "@id" : 18,
    "exprs" : [ {
      "ref" : "`$f0`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    } ],
    "child" : 20,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 401.25
  }, {
    "pop" : "hash-aggregate",
    "@id" : 15,
    "child" : 18,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 200.625,
    "groupByExprs" : [ {
      "ref" : "`$f0`",
      "expr" : "`$f0`"
    } ],
    "aggrExprs" : [ ]
  }, {
    "pop" : "hash-join",
    "@id" : 13,
    "left" : 16,
    "right" : 15,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_orderkey`",
      "right" : "`$f0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3517.5
  }, {
    "pop" : "project",
    "@id" : 11,
    "exprs" : [ {
      "ref" : "`$f01`",
      "expr" : "`$f0`"
    }, {
      "ref" : "`$f0`",
      "expr" : "true"
    } ],
    "child" : 13,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3517.5
  }, {
    "pop" : "hash-aggregate",
    "@id" : 9,
    "child" : 11,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75,
    "groupByExprs" : [ {
      "ref" : "`$f01`",
      "expr" : "`$f01`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`$f1`",
      "expr" : "min(`$f0`) "
    } ]
  }, {
    "pop" : "hash-join",
    "@id" : 8,
    "left" : 10,
    "right" : 9,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`o_orderkey`",
      "right" : "`$f01`"
    } ],
    "joinType" : "LEFT",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "filter",
    "@id" : 7,
    "child" : 8,
    "expr" : "istrue(`$f1`) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 439.6875
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 6,
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 439.6875
  }, {
    "pop" : "project",
    "@id" : 5,
    "exprs" : [ {
      "ref" : "`o_orderpriority`",
      "expr" : "`o_orderpriority`"
    } ],
    "child" : 6,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 439.6875
  }, {
    "pop" : "hash-aggregate",
    "@id" : 4,
    "child" : 5,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 219.84375,
    "groupByExprs" : [ {
      "ref" : "`o_orderpriority`",
      "expr" : "`o_orderpriority`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`order_count`",
      "expr" : "count(1) "
    } ]
  }, {
    "pop" : "external-sort",
    "@id" : 3,
    "child" : 4,
    "orderings" : [ {
      "order" : "ASC",
      "expr" : "`o_orderpriority`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 43.96875
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 43.96875
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`o_orderpriority`",
      "expr" : "`o_orderpriority`"
    }, {
      "ref" : "`order_count`",
      "expr" : "`order_count`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 43.96875
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 43.96875
  } ]
}