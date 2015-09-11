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
    "@id" : 21,
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
    "@id" : 19,
    "child" : 21,
    "expr" : "less_than(cast( (`columns`[4] ) as DATE ), cast( 796089600000 as DATE)) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 802.5
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 16,
    "child" : 19,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 802.5
  }, {
    "pop" : "project",
    "@id" : 13,
    "exprs" : [ {
      "ref" : "`o_orderkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`o_custkey`",
      "expr" : "cast( (`columns`[1] ) as INT )"
    }, {
      "ref" : "`o_orderdate`",
      "expr" : "cast( (`columns`[4] ) as DATE )"
    }, {
      "ref" : "`o_shippriority`",
      "expr" : "cast( (`columns`[7] ) as INT )"
    } ],
    "child" : 16,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 802.5
  }, {
    "pop" : "fs-scan",
    "@id" : 18,
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
    "@id" : 15,
    "child" : 18,
    "expr" : "greater_than(cast( (`columns`[10] ) as DATE ), cast( 796089600000 as DATE)) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3517.5
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 12,
    "child" : 15,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3517.5
  }, {
    "pop" : "project",
    "@id" : 10,
    "exprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "cast( (`columns`[5] ) as FLOAT8 )"
    }, {
      "ref" : "`l_discount`",
      "expr" : "cast( (`columns`[6] ) as FLOAT8 )"
    }, {
      "ref" : "`l_shipdate`",
      "expr" : "cast( (`columns`[10] ) as DATE )"
    } ],
    "child" : 12,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3517.5
  }, {
    "pop" : "fs-scan",
    "@id" : 22,
    "files" : [ "maprfs:/drill/testdata/json_storage/customer.tbl" ],
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
    "selectionRoot" : "/drill/testdata/json_storage/customer.tbl",
    "cost" : 233.0
  }, {
    "pop" : "filter",
    "@id" : 20,
    "child" : 22,
    "expr" : "equal(cast( (`columns`[6] ) as VARCHAR(9) ), 'HOUSEHOLD') ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 34.949999999999996
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 17,
    "child" : 20,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 34.949999999999996
  }, {
    "pop" : "project",
    "@id" : 14,
    "exprs" : [ {
      "ref" : "`c_custkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`c_mktsegment`",
      "expr" : "`columns`[6]"
    } ],
    "child" : 17,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 34.949999999999996
  }, {
    "pop" : "hash-join",
    "@id" : 11,
    "left" : 14,
    "right" : 13,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`c_custkey`",
      "right" : "`o_custkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 802.5
  }, {
    "pop" : "hash-join",
    "@id" : 9,
    "left" : 11,
    "right" : 10,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`o_orderkey`",
      "right" : "`l_orderkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3517.5
  }, {
    "pop" : "project",
    "@id" : 8,
    "exprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "`l_orderkey`"
    }, {
      "ref" : "`o_orderdate`",
      "expr" : "`o_orderdate`"
    }, {
      "ref" : "`o_shippriority`",
      "expr" : "`o_shippriority`"
    }, {
      "ref" : "`$f3`",
      "expr" : "multiply(`l_extendedprice`, subtract(1, `l_discount`) ) "
    } ],
    "child" : 9,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3517.5
  }, {
    "pop" : "hash-aggregate",
    "@id" : 7,
    "child" : 8,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3077.8125,
    "groupByExprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "`l_orderkey`"
    }, {
      "ref" : "`o_orderdate`",
      "expr" : "`o_orderdate`"
    }, {
      "ref" : "`o_shippriority`",
      "expr" : "`o_shippriority`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`revenue`",
      "expr" : "sum(`$f3`) "
    } ]
  }, {
    "pop" : "project",
    "@id" : 6,
    "exprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "`l_orderkey`"
    }, {
      "ref" : "`revenue`",
      "expr" : "`revenue`"
    }, {
      "ref" : "`o_orderdate`",
      "expr" : "`o_orderdate`"
    }, {
      "ref" : "`o_shippriority`",
      "expr" : "`o_shippriority`"
    } ],
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 351.75
  }, {
    "pop" : "top-n",
    "@id" : 5,
    "child" : 6,
    "orderings" : [ {
      "order" : "DESC",
      "expr" : "`revenue`",
      "nullDirection" : "UNSPECIFIED"
    }, {
      "order" : "ASC",
      "expr" : "`o_orderdate`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
    "limit" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 351.75
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 4,
    "child" : 5,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 351.75
  }, {
    "pop" : "limit",
    "@id" : 3,
    "child" : 4,
    "first" : 0,
    "last" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 351.75
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 351.75
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "`l_orderkey`"
    }, {
      "ref" : "`revenue`",
      "expr" : "`revenue`"
    }, {
      "ref" : "`o_orderdate`",
      "expr" : "`o_orderdate`"
    }, {
      "ref" : "`o_shippriority`",
      "expr" : "`o_shippriority`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 351.75
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 351.75
  } ]
}