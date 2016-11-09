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
    "@id" : 23,
    "files" : [ "maprfs:/drill/testdata/json_storage/lineitem/lineitem.json" ],
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
      "type" : "json"
    },
    "selectionRoot" : "/drill/testdata/json_storage/lineitem",
    "cost" : 26016.0
  }, {
    "pop" : "project",
    "@id" : 21,
    "exprs" : [ {
      "ref" : "`T85¦¦*`",
      "expr" : "`*`"
    } ],
    "child" : 23,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 26016.0
  }, {
    "pop" : "filter",
    "@id" : 19,
    "child" : 21,
    "expr" : "less_than(`T85¦¦l_commitdate`, `T85¦¦l_receiptdate`) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13008.0
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 16,
    "child" : 19,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13008.0
  }, {
    "pop" : "fs-scan",
    "@id" : 25,
    "files" : [ "maprfs:/drill/testdata/json_storage/orders/orders.json" ],
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
      "type" : "json"
    },
    "selectionRoot" : "/drill/testdata/json_storage/orders",
    "cost" : 4403.0
  }, {
    "pop" : "project",
    "@id" : 24,
    "exprs" : [ {
      "ref" : "`T86¦¦*`",
      "expr" : "`*`"
    } ],
    "child" : 25,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4403.0
  }, {
    "pop" : "filter",
    "@id" : 22,
    "child" : 24,
    "expr" : "booleanAnd(greater_than_or_equal_to(`T86¦¦o_orderdate`, cast( 844128000000 as DATE)) , less_than(`T86¦¦o_orderdate`, add(cast( 844128000000 as DATE), cast( 'P3M' as INTERVALYEAR)) ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1100.75
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 20,
    "child" : 22,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1100.75
  }, {
    "pop" : "project",
    "@id" : 18,
    "exprs" : [ {
      "ref" : "`T86¦¦o_orderkey`",
      "expr" : "`T86¦¦o_orderkey`"
    } ],
    "child" : 20,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1100.75
  }, {
    "pop" : "hash-aggregate",
    "@id" : 15,
    "child" : 18,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 550.375,
    "groupByExprs" : [ {
      "ref" : "`T86¦¦o_orderkey`",
      "expr" : "`T86¦¦o_orderkey`"
    } ],
    "aggrExprs" : [ ]
  }, {
    "pop" : "hash-join",
    "@id" : 13,
    "left" : 16,
    "right" : 15,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`T85¦¦l_orderkey`",
      "right" : "`T86¦¦o_orderkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13008.0
  }, {
    "pop" : "project",
    "@id" : 11,
    "exprs" : [ {
      "ref" : "`T86¦¦o_orderkey`",
      "expr" : "`T86¦¦o_orderkey`"
    }, {
      "ref" : "`$f0`",
      "expr" : "true"
    } ],
    "child" : 13,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13008.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 9,
    "child" : 11,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 6504.0,
    "groupByExprs" : [ {
      "ref" : "`T86¦¦o_orderkey`",
      "expr" : "`T86¦¦o_orderkey`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`$f1`",
      "expr" : "min(`$f0`) "
    } ]
  }, {
    "pop" : "fs-scan",
    "@id" : 17,
    "files" : [ "maprfs:/drill/testdata/json_storage/orders/orders.json" ],
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
      "type" : "json"
    },
    "selectionRoot" : "/drill/testdata/json_storage/orders",
    "cost" : 4403.0
  }, {
    "pop" : "project",
    "@id" : 14,
    "exprs" : [ {
      "ref" : "`T84¦¦*`",
      "expr" : "`*`"
    } ],
    "child" : 17,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4403.0
  }, {
    "pop" : "filter",
    "@id" : 12,
    "child" : 14,
    "expr" : "booleanAnd(greater_than_or_equal_to(`T84¦¦o_orderdate`, cast( 844128000000 as DATE)) , less_than(`T84¦¦o_orderdate`, add(cast( 844128000000 as DATE), cast( 'P3M' as INTERVALYEAR)) ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1100.75
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 10,
    "child" : 12,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1100.75
  }, {
    "pop" : "hash-join",
    "@id" : 8,
    "left" : 10,
    "right" : 9,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`T84¦¦o_orderkey`",
      "right" : "`T86¦¦o_orderkey`"
    } ],
    "joinType" : "LEFT",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 6504.0
  }, {
    "pop" : "filter",
    "@id" : 7,
    "child" : 8,
    "expr" : "istrue(`$f1`) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1626.0
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 6,
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1626.0
  }, {
    "pop" : "project",
    "@id" : 5,
    "exprs" : [ {
      "ref" : "`T84¦¦o_orderpriority`",
      "expr" : "`T84¦¦o_orderpriority`"
    } ],
    "child" : 6,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1626.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 4,
    "child" : 5,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 813.0,
    "groupByExprs" : [ {
      "ref" : "`T84¦¦o_orderpriority`",
      "expr" : "`T84¦¦o_orderpriority`"
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
      "expr" : "`T84¦¦o_orderpriority`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 162.6
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 162.6
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`o_orderpriority`",
      "expr" : "`T84¦¦o_orderpriority`"
    }, {
      "ref" : "`order_count`",
      "expr" : "`order_count`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 162.6
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 162.6
  } ]
}