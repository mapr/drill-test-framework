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
    "@id" : 13,
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
    "columns" : [ "`columns`[0]" ],
    "selectionRoot" : "/drill/testdata/json_storage/customer.tbl",
    "cost" : 233.0
  }, {
    "pop" : "project",
    "@id" : 11,
    "exprs" : [ {
      "ref" : "`c_custkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    } ],
    "child" : 13,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 233.0
  }, {
    "pop" : "fs-scan",
    "@id" : 15,
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
    "child" : 15,
    "expr" : "not(like(`columns`[8], '%special%requests%') ) ",
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
      "ref" : "`o_custkey`",
      "expr" : "cast( (`columns`[1] ) as INT )"
    } ],
    "child" : 12,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 401.25
  }, {
    "pop" : "hash-join",
    "@id" : 9,
    "left" : 11,
    "right" : 10,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`c_custkey`",
      "right" : "`o_custkey`"
    } ],
    "joinType" : "LEFT",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 401.25
  }, {
    "pop" : "project",
    "@id" : 8,
    "exprs" : [ {
      "ref" : "`c_custkey`",
      "expr" : "`c_custkey`"
    }, {
      "ref" : "`o_orderkey`",
      "expr" : "`o_orderkey`"
    } ],
    "child" : 9,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 401.25
  }, {
    "pop" : "hash-aggregate",
    "@id" : 7,
    "child" : 8,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 200.625,
    "groupByExprs" : [ {
      "ref" : "`c_custkey`",
      "expr" : "`c_custkey`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`EXPR$1`",
      "expr" : "count(`o_orderkey`) "
    } ]
  }, {
    "pop" : "project",
    "@id" : 6,
    "exprs" : [ {
      "ref" : "`EXPR$1`",
      "expr" : "`EXPR$1`"
    } ],
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 40.125
  }, {
    "pop" : "hash-aggregate",
    "@id" : 5,
    "child" : 6,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 20.0625,
    "groupByExprs" : [ {
      "ref" : "`EXPR$1`",
      "expr" : "`EXPR$1`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`custdist`",
      "expr" : "count(1) "
    } ]
  }, {
    "pop" : "project",
    "@id" : 4,
    "exprs" : [ {
      "ref" : "`c_count`",
      "expr" : "`EXPR$1`"
    }, {
      "ref" : "`custdist`",
      "expr" : "`custdist`"
    } ],
    "child" : 5,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4.0125
  }, {
    "pop" : "external-sort",
    "@id" : 3,
    "child" : 4,
    "orderings" : [ {
      "order" : "DESC",
      "expr" : "`custdist`",
      "nullDirection" : "UNSPECIFIED"
    }, {
      "order" : "DESC",
      "expr" : "`c_count`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4.0125
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4.0125
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`c_count`",
      "expr" : "`c_count`"
    }, {
      "ref" : "`custdist`",
      "expr" : "`custdist`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4.0125
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4.0125
  } ]
}