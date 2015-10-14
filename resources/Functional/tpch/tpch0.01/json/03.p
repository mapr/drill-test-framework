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
    "@id" : 19,
    "exprs" : [ {
      "ref" : "`T32¦¦*`",
      "expr" : "`*`"
    } ],
    "child" : 21,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4403.0
  }, {
    "pop" : "filter",
    "@id" : 16,
    "child" : 19,
    "expr" : "less_than(`T32¦¦o_orderdate`, cast( 796089600000 as DATE)) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2201.5
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 13,
    "child" : 16,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2201.5
  }, {
    "pop" : "fs-scan",
    "@id" : 22,
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
    "@id" : 20,
    "exprs" : [ {
      "ref" : "`T31¦¦*`",
      "expr" : "`*`"
    } ],
    "child" : 22,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 26016.0
  }, {
    "pop" : "filter",
    "@id" : 17,
    "child" : 20,
    "expr" : "greater_than(`T31¦¦l_shipdate`, cast( 796089600000 as DATE)) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13008.0
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 14,
    "child" : 17,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13008.0
  }, {
    "pop" : "hash-join",
    "@id" : 11,
    "left" : 14,
    "right" : 13,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`T31¦¦l_orderkey`",
      "right" : "`T32¦¦o_orderkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13008.0
  }, {
    "pop" : "fs-scan",
    "@id" : 18,
    "files" : [ "maprfs:/drill/testdata/json_storage/customer/customer.json" ],
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
    "selectionRoot" : "/drill/testdata/json_storage/customer",
    "cost" : 457.0
  }, {
    "pop" : "project",
    "@id" : 15,
    "exprs" : [ {
      "ref" : "`T33¦¦*`",
      "expr" : "`*`"
    } ],
    "child" : 18,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 457.0
  }, {
    "pop" : "filter",
    "@id" : 12,
    "child" : 15,
    "expr" : "equal(cast( (`T33¦¦c_mktsegment` ) as VARCHAR(9) ), 'HOUSEHOLD') ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 68.55
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 10,
    "child" : 12,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 68.55
  }, {
    "pop" : "hash-join",
    "@id" : 9,
    "left" : 11,
    "right" : 10,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`T32¦¦o_custkey`",
      "right" : "`T33¦¦c_custkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13008.0
  }, {
    "pop" : "project",
    "@id" : 8,
    "exprs" : [ {
      "ref" : "`T31¦¦l_orderkey`",
      "expr" : "`T31¦¦l_orderkey`"
    }, {
      "ref" : "`T32¦¦o_orderdate`",
      "expr" : "`T32¦¦o_orderdate`"
    }, {
      "ref" : "`T32¦¦o_shippriority`",
      "expr" : "`T32¦¦o_shippriority`"
    }, {
      "ref" : "`$f3`",
      "expr" : "multiply(`T31¦¦l_extendedprice`, subtract(1, `T31¦¦l_discount`) ) "
    } ],
    "child" : 9,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13008.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 7,
    "child" : 8,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 11382.0,
    "groupByExprs" : [ {
      "ref" : "`T31¦¦l_orderkey`",
      "expr" : "`T31¦¦l_orderkey`"
    }, {
      "ref" : "`T32¦¦o_orderdate`",
      "expr" : "`T32¦¦o_orderdate`"
    }, {
      "ref" : "`T32¦¦o_shippriority`",
      "expr" : "`T32¦¦o_shippriority`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`revenue`",
      "expr" : "sum(`$f3`) "
    } ]
  }, {
    "pop" : "project",
    "@id" : 6,
    "exprs" : [ {
      "ref" : "`T31¦¦l_orderkey`",
      "expr" : "`T31¦¦l_orderkey`"
    }, {
      "ref" : "`revenue`",
      "expr" : "`revenue`"
    }, {
      "ref" : "`T32¦¦o_orderdate`",
      "expr" : "`T32¦¦o_orderdate`"
    }, {
      "ref" : "`T32¦¦o_shippriority`",
      "expr" : "`T32¦¦o_shippriority`"
    } ],
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1300.8
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
      "expr" : "`T32¦¦o_orderdate`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
    "limit" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1300.8
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 4,
    "child" : 5,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1300.8
  }, {
    "pop" : "limit",
    "@id" : 3,
    "child" : 4,
    "first" : 0,
    "last" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1300.8
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1300.8
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "`T31¦¦l_orderkey`"
    }, {
      "ref" : "`revenue`",
      "expr" : "`revenue`"
    }, {
      "ref" : "`o_orderdate`",
      "expr" : "`T32¦¦o_orderdate`"
    }, {
      "ref" : "`o_shippriority`",
      "expr" : "`T32¦¦o_shippriority`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1300.8
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1300.8
  } ]
}