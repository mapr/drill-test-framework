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
    "pop" : "producer-consumer",
    "@id" : 19,
    "child" : 23,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 26016.0
  }, {
    "pop" : "fs-scan",
    "@id" : 21,
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
    "pop" : "producer-consumer",
    "@id" : 17,
    "child" : 21,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 457.0
  }, {
    "pop" : "project",
    "@id" : 14,
    "exprs" : [ {
      "ref" : "`*1`",
      "expr" : "`*`"
    }, {
      "ref" : "`c_name`",
      "expr" : "`c_name`"
    }, {
      "ref" : "`c_custkey`",
      "expr" : "`c_custkey`"
    } ],
    "child" : 17,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 457.0
  }, {
    "pop" : "fs-scan",
    "@id" : 27,
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
    "pop" : "producer-consumer",
    "@id" : 26,
    "child" : 27,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 26016.0
  }, {
    "pop" : "project",
    "@id" : 24,
    "exprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "`l_orderkey`"
    }, {
      "ref" : "`l_quantity`",
      "expr" : "`l_quantity`"
    } ],
    "child" : 26,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 26016.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 20,
    "child" : 24,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13008.0,
    "groupByExprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "`l_orderkey`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`$f1`",
      "expr" : "sum(`l_quantity`) "
    } ]
  }, {
    "pop" : "filter",
    "@id" : 16,
    "child" : 20,
    "expr" : "greater_than(`$f1`, 300) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1300.8
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 13,
    "child" : 16,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1300.8
  }, {
    "pop" : "project",
    "@id" : 11,
    "exprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "`l_orderkey`"
    } ],
    "child" : 13,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1300.8
  }, {
    "pop" : "hash-aggregate",
    "@id" : 9,
    "child" : 11,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 650.4,
    "groupByExprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "`l_orderkey`"
    } ],
    "aggrExprs" : [ ]
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
    "pop" : "producer-consumer",
    "@id" : 22,
    "child" : 25,
    "size" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4403.0
  }, {
    "pop" : "project",
    "@id" : 18,
    "exprs" : [ {
      "ref" : "`*0`",
      "expr" : "`*`"
    }, {
      "ref" : "`o_orderkey`",
      "expr" : "`o_orderkey`"
    }, {
      "ref" : "`o_orderdate`",
      "expr" : "`o_orderdate`"
    }, {
      "ref" : "`o_totalprice`",
      "expr" : "`o_totalprice`"
    }, {
      "ref" : "`o_custkey`",
      "expr" : "`o_custkey`"
    } ],
    "child" : 22,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4403.0
  }, {
    "pop" : "hash-join",
    "@id" : 15,
    "left" : 19,
    "right" : 18,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_orderkey`",
      "right" : "`o_orderkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 26016.0
  }, {
    "pop" : "hash-join",
    "@id" : 12,
    "left" : 15,
    "right" : 14,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`o_custkey`",
      "right" : "`c_custkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 26016.0
  }, {
    "pop" : "project",
    "@id" : 10,
    "exprs" : [ {
      "ref" : "`$f1`",
      "expr" : "`c_name`"
    }, {
      "ref" : "`$f2`",
      "expr" : "`c_custkey`"
    }, {
      "ref" : "`$f4`",
      "expr" : "`o_orderkey`"
    }, {
      "ref" : "`$f5`",
      "expr" : "`o_orderdate`"
    }, {
      "ref" : "`$f6`",
      "expr" : "`o_totalprice`"
    }, {
      "ref" : "`$f10`",
      "expr" : "`l_quantity`"
    }, {
      "ref" : "`$f11`",
      "expr" : "`o_orderkey`"
    } ],
    "child" : 12,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 26016.0
  }, {
    "pop" : "hash-join",
    "@id" : 8,
    "left" : 10,
    "right" : 9,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`$f11`",
      "right" : "`l_orderkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 26016.0
  }, {
    "pop" : "project",
    "@id" : 7,
    "exprs" : [ {
      "ref" : "`c_name`",
      "expr" : "`$f1`"
    }, {
      "ref" : "`c_custkey`",
      "expr" : "`$f2`"
    }, {
      "ref" : "`o_orderkey`",
      "expr" : "`$f4`"
    }, {
      "ref" : "`o_orderdate`",
      "expr" : "`$f5`"
    }, {
      "ref" : "`o_totalprice`",
      "expr" : "`$f6`"
    }, {
      "ref" : "`$f10`",
      "expr" : "`$f10`"
    } ],
    "child" : 8,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 26016.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 6,
    "child" : 7,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 25203.0,
    "groupByExprs" : [ {
      "ref" : "`c_name`",
      "expr" : "`c_name`"
    }, {
      "ref" : "`c_custkey`",
      "expr" : "`c_custkey`"
    }, {
      "ref" : "`o_orderkey`",
      "expr" : "`o_orderkey`"
    }, {
      "ref" : "`o_orderdate`",
      "expr" : "`o_orderdate`"
    }, {
      "ref" : "`o_totalprice`",
      "expr" : "`o_totalprice`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`EXPR$5`",
      "expr" : "sum(`$f10`) "
    } ]
  }, {
    "pop" : "top-n",
    "@id" : 5,
    "child" : 6,
    "orderings" : [ {
      "order" : "DESC",
      "expr" : "`o_totalprice`",
      "nullDirection" : "UNSPECIFIED"
    }, {
      "order" : "ASC",
      "expr" : "`o_orderdate`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
    "limit" : 100,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2601.6
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 4,
    "child" : 5,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2601.6
  }, {
    "pop" : "limit",
    "@id" : 3,
    "child" : 4,
    "first" : 0,
    "last" : 100,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2601.6
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2601.6
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`c_name`",
      "expr" : "`c_name`"
    }, {
      "ref" : "`c_custkey`",
      "expr" : "`c_custkey`"
    }, {
      "ref" : "`o_orderkey`",
      "expr" : "`o_orderkey`"
    }, {
      "ref" : "`o_orderdate`",
      "expr" : "`o_orderdate`"
    }, {
      "ref" : "`o_totalprice`",
      "expr" : "`o_totalprice`"
    }, {
      "ref" : "`EXPR$5`",
      "expr" : "`EXPR$5`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2601.6
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2601.6
  } ]
}