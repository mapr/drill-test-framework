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
    "columns" : [ "`columns`[0]", "`columns`[1]" ],
    "selectionRoot" : "/drill/testdata/json_storage/orders.tbl",
    "cost" : 1605.0
  }, {
    "pop" : "project",
    "@id" : 19,
    "exprs" : [ {
      "ref" : "`o_orderkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`o_custkey`",
      "expr" : "cast( (`columns`[1] ) as INT )"
    } ],
    "child" : 21,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1605.0
  }, {
    "pop" : "fs-scan",
    "@id" : 27,
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
    "@id" : 26,
    "child" : 27,
    "expr" : "booleanAnd(greater_than_or_equal_to(cast( (`columns`[10] ) as DATE ), cast( 788918400000 as DATE)) , less_than_or_equal_to(cast( (`columns`[10] ) as DATE ), cast( 851990400000 as DATE)) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 24,
    "child" : 26,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "project",
    "@id" : 22,
    "exprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`l_suppkey`",
      "expr" : "cast( (`columns`[2] ) as INT )"
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
    "child" : 24,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "fs-scan",
    "@id" : 25,
    "files" : [ "maprfs:/drill/testdata/json_storage/supplier.tbl" ],
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
    "columns" : [ "`columns`[0]", "`columns`[3]" ],
    "selectionRoot" : "/drill/testdata/json_storage/supplier.tbl",
    "cost" : 13.0
  }, {
    "pop" : "project",
    "@id" : 23,
    "exprs" : [ {
      "ref" : "`s_suppkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`s_nationkey`",
      "expr" : "cast( (`columns`[3] ) as INT )"
    } ],
    "child" : 25,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13.0
  }, {
    "pop" : "hash-join",
    "@id" : 20,
    "left" : 23,
    "right" : 22,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`s_suppkey`",
      "right" : "`l_suppkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "hash-join",
    "@id" : 17,
    "left" : 20,
    "right" : 19,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`l_orderkey`",
      "right" : "`o_orderkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "fs-scan",
    "@id" : 15,
    "files" : [ "maprfs:/drill/testdata/json_storage/nation.tbl" ],
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
    "columns" : [ "`columns`[0]", "`columns`[1]" ],
    "selectionRoot" : "/drill/testdata/json_storage/nation.tbl",
    "cost" : 2.0
  }, {
    "pop" : "project",
    "@id" : 12,
    "exprs" : [ {
      "ref" : "`n_nationkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`n_name`",
      "expr" : "`columns`[1]"
    } ],
    "child" : 15,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2.0
  }, {
    "pop" : "fs-scan",
    "@id" : 18,
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
    "columns" : [ "`columns`[0]", "`columns`[3]" ],
    "selectionRoot" : "/drill/testdata/json_storage/customer.tbl",
    "cost" : 233.0
  }, {
    "pop" : "project",
    "@id" : 16,
    "exprs" : [ {
      "ref" : "`c_custkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`c_nationkey`",
      "expr" : "cast( (`columns`[3] ) as INT )"
    } ],
    "child" : 18,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 233.0
  }, {
    "pop" : "hash-join",
    "@id" : 13,
    "left" : 17,
    "right" : 16,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`o_custkey`",
      "right" : "`c_custkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "hash-join",
    "@id" : 10,
    "left" : 13,
    "right" : 12,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`c_nationkey`",
      "right" : "`n_nationkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "fs-scan",
    "@id" : 14,
    "files" : [ "maprfs:/drill/testdata/json_storage/nation.tbl" ],
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
    "columns" : [ "`columns`[0]", "`columns`[1]" ],
    "selectionRoot" : "/drill/testdata/json_storage/nation.tbl",
    "cost" : 2.0
  }, {
    "pop" : "project",
    "@id" : 11,
    "exprs" : [ {
      "ref" : "`n_nationkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`n_name`",
      "expr" : "`columns`[1]"
    } ],
    "child" : 14,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2.0
  }, {
    "pop" : "project",
    "@id" : 9,
    "exprs" : [ {
      "ref" : "`n_nationkey0`",
      "expr" : "`n_nationkey`"
    }, {
      "ref" : "`n_name0`",
      "expr" : "`n_name`"
    } ],
    "child" : 11,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 2.0
  }, {
    "pop" : "hash-join",
    "@id" : 8,
    "left" : 10,
    "right" : 9,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`s_nationkey`",
      "right" : "`n_nationkey0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1758.75
  }, {
    "pop" : "filter",
    "@id" : 7,
    "child" : 8,
    "expr" : "booleanOr(booleanAnd(equal(cast( (`n_name0` ) as VARCHAR(5) ), 'EGYPT') , equal(cast( (`n_name` ) as VARCHAR(13) ), 'UNITED STATES') ) , booleanAnd(equal(cast( (`n_name0` ) as VARCHAR(13) ), 'UNITED STATES') , equal(cast( (`n_name` ) as VARCHAR(5) ), 'EGYPT') ) ) ",
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
      "ref" : "`supp_nation`",
      "expr" : "`n_name0`"
    }, {
      "ref" : "`cust_nation`",
      "expr" : "`n_name`"
    }, {
      "ref" : "`l_year`",
      "expr" : "extractYear(`l_shipdate`) "
    }, {
      "ref" : "`volume`",
      "expr" : "multiply(`l_extendedprice`, subtract(1, `l_discount`) ) "
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
    "cost" : 384.7265625,
    "groupByExprs" : [ {
      "ref" : "`supp_nation`",
      "expr" : "`supp_nation`"
    }, {
      "ref" : "`cust_nation`",
      "expr" : "`cust_nation`"
    }, {
      "ref" : "`l_year`",
      "expr" : "`l_year`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`revenue`",
      "expr" : "sum(`volume`) "
    } ]
  }, {
    "pop" : "external-sort",
    "@id" : 3,
    "child" : 4,
    "orderings" : [ {
      "order" : "ASC",
      "expr" : "`supp_nation`",
      "nullDirection" : "UNSPECIFIED"
    }, {
      "order" : "ASC",
      "expr" : "`cust_nation`",
      "nullDirection" : "UNSPECIFIED"
    }, {
      "order" : "ASC",
      "expr" : "`l_year`",
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
      "ref" : "`supp_nation`",
      "expr" : "`supp_nation`"
    }, {
      "ref" : "`cust_nation`",
      "expr" : "`cust_nation`"
    }, {
      "ref" : "`l_year`",
      "expr" : "`l_year`"
    }, {
      "ref" : "`revenue`",
      "expr" : "`revenue`"
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