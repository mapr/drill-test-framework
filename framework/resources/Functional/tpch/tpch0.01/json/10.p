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
    "@id" : 22,
    "exprs" : [ {
      "ref" : "`T25¦¦*`",
      "expr" : "`*`"
    } ],
    "child" : 23,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4403.0
  }, {
    "pop" : "filter",
    "@id" : 20,
    "child" : 22,
    "expr" : "booleanAnd(greater_than_or_equal_to(`T25¦¦o_orderdate`, cast( 762480000000 as DATE)) , less_than(`T25¦¦o_orderdate`, add(cast( 762480000000 as DATE), cast( 'P3M' as INTERVALYEAR)) ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1100.75
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 17,
    "child" : 20,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1100.75
  }, {
    "pop" : "fs-scan",
    "@id" : 16,
    "files" : [ "maprfs:/drill/testdata/json_storage/nation/nation.json" ],
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
    "selectionRoot" : "/drill/testdata/json_storage/nation",
    "cost" : 4.0
  }, {
    "pop" : "project",
    "@id" : 13,
    "exprs" : [ {
      "ref" : "`T26¦¦*`",
      "expr" : "`*`"
    } ],
    "child" : 16,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 4.0
  }, {
    "pop" : "fs-scan",
    "@id" : 19,
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
    "@id" : 15,
    "exprs" : [ {
      "ref" : "`T27¦¦*`",
      "expr" : "`*`"
    } ],
    "child" : 19,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 26016.0
  }, {
    "pop" : "filter",
    "@id" : 12,
    "child" : 15,
    "expr" : "equal(cast( (`T27¦¦l_returnflag` ) as VARCHAR(1) ), 'R') ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3902.3999999999996
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 10,
    "child" : 12,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3902.3999999999996
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
    "pop" : "project",
    "@id" : 18,
    "exprs" : [ {
      "ref" : "`T24¦¦*`",
      "expr" : "`*`"
    } ],
    "child" : 21,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 457.0
  }, {
    "pop" : "hash-join",
    "@id" : 14,
    "left" : 18,
    "right" : 17,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`T24¦¦c_custkey`",
      "right" : "`T25¦¦o_custkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1100.75
  }, {
    "pop" : "hash-join",
    "@id" : 11,
    "left" : 14,
    "right" : 13,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`T24¦¦c_nationkey`",
      "right" : "`T26¦¦n_nationkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1100.75
  }, {
    "pop" : "hash-join",
    "@id" : 9,
    "left" : 11,
    "right" : 10,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`T25¦¦o_orderkey`",
      "right" : "`T27¦¦l_orderkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3902.3999999999996
  }, {
    "pop" : "project",
    "@id" : 8,
    "exprs" : [ {
      "ref" : "`T24¦¦c_custkey`",
      "expr" : "`T24¦¦c_custkey`"
    }, {
      "ref" : "`T24¦¦c_name`",
      "expr" : "`T24¦¦c_name`"
    }, {
      "ref" : "`T24¦¦c_acctbal`",
      "expr" : "`T24¦¦c_acctbal`"
    }, {
      "ref" : "`T24¦¦c_phone`",
      "expr" : "`T24¦¦c_phone`"
    }, {
      "ref" : "`T26¦¦n_name`",
      "expr" : "`T26¦¦n_name`"
    }, {
      "ref" : "`T24¦¦c_address`",
      "expr" : "`T24¦¦c_address`"
    }, {
      "ref" : "`T24¦¦c_comment`",
      "expr" : "`T24¦¦c_comment`"
    }, {
      "ref" : "`$f7`",
      "expr" : "multiply(`T27¦¦l_extendedprice`, subtract(1, `T27¦¦l_discount`) ) "
    } ],
    "child" : 9,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3902.3999999999996
  }, {
    "pop" : "hash-aggregate",
    "@id" : 7,
    "child" : 8,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 3871.9124999999995,
    "groupByExprs" : [ {
      "ref" : "`T24¦¦c_custkey`",
      "expr" : "`T24¦¦c_custkey`"
    }, {
      "ref" : "`T24¦¦c_name`",
      "expr" : "`T24¦¦c_name`"
    }, {
      "ref" : "`T24¦¦c_acctbal`",
      "expr" : "`T24¦¦c_acctbal`"
    }, {
      "ref" : "`T24¦¦c_phone`",
      "expr" : "`T24¦¦c_phone`"
    }, {
      "ref" : "`T26¦¦n_name`",
      "expr" : "`T26¦¦n_name`"
    }, {
      "ref" : "`T24¦¦c_address`",
      "expr" : "`T24¦¦c_address`"
    }, {
      "ref" : "`T24¦¦c_comment`",
      "expr" : "`T24¦¦c_comment`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`revenue`",
      "expr" : "sum(`$f7`) "
    } ]
  }, {
    "pop" : "project",
    "@id" : 6,
    "exprs" : [ {
      "ref" : "`T24¦¦c_custkey`",
      "expr" : "`T24¦¦c_custkey`"
    }, {
      "ref" : "`T24¦¦c_name`",
      "expr" : "`T24¦¦c_name`"
    }, {
      "ref" : "`revenue`",
      "expr" : "`revenue`"
    }, {
      "ref" : "`T24¦¦c_acctbal`",
      "expr" : "`T24¦¦c_acctbal`"
    }, {
      "ref" : "`T26¦¦n_name`",
      "expr" : "`T26¦¦n_name`"
    }, {
      "ref" : "`T24¦¦c_address`",
      "expr" : "`T24¦¦c_address`"
    }, {
      "ref" : "`T24¦¦c_phone`",
      "expr" : "`T24¦¦c_phone`"
    }, {
      "ref" : "`T24¦¦c_comment`",
      "expr" : "`T24¦¦c_comment`"
    } ],
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 390.23999999999995
  }, {
    "pop" : "top-n",
    "@id" : 5,
    "child" : 6,
    "orderings" : [ {
      "order" : "DESC",
      "expr" : "`revenue`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
    "limit" : 20,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 390.23999999999995
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 4,
    "child" : 5,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 390.23999999999995
  }, {
    "pop" : "limit",
    "@id" : 3,
    "child" : 4,
    "first" : 0,
    "last" : 20,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 390.23999999999995
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 390.23999999999995
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`c_custkey`",
      "expr" : "`T24¦¦c_custkey`"
    }, {
      "ref" : "`c_name`",
      "expr" : "`T24¦¦c_name`"
    }, {
      "ref" : "`revenue`",
      "expr" : "`revenue`"
    }, {
      "ref" : "`c_acctbal`",
      "expr" : "`T24¦¦c_acctbal`"
    }, {
      "ref" : "`n_name`",
      "expr" : "`T26¦¦n_name`"
    }, {
      "ref" : "`c_address`",
      "expr" : "`T24¦¦c_address`"
    }, {
      "ref" : "`c_phone`",
      "expr" : "`T24¦¦c_phone`"
    }, {
      "ref" : "`c_comment`",
      "expr" : "`T24¦¦c_comment`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 390.23999999999995
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 390.23999999999995
  } ]
}