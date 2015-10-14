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
    "@id" : 2,
    "files" : [ "maprfs:/drill/testdata/json_storage/datasources/input2.json" ],
    "storage" : {
      "type" : "file",
      "enabled" : true,
      "connection" : "maprfs:///",
      "workspaces" : {
        "root" : {
          "location" : "/user/root/drill",
          "writable" : true,
          "storageformat" : "null"
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
          "storageformat" : "null"
        },
        "drillTestDirP1Smoke" : {
          "location" : "/drill/testdata/p1tests-smoke",
          "writable" : true,
          "storageformat" : "null"
        },
        "drillTestDirExchanges" : {
          "location" : "/drill/testdata/exchanges_test",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "TpcHMulti" : {
          "location" : "/drill/testdata/tpch-multi/datasources",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "TpcHMulti100" : {
          "location" : "/drill/testdata/SF100",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "TpcHMulti1" : {
          "location" : "/drill/testdata/tpch_SF1",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirExplicitCast" : {
          "location" : "/drill/testdata/explicit_cast/datasources",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirImplicitCast" : {
          "location" : "/drill/testdata/implicit_cast/datasources",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirTPCDS" : {
          "location" : "/user/root/tpcds/parquet",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillMondrian" : {
          "location" : "/user/root/mondrian",
          "writable" : true,
          "storageformat" : "parquet"
        },
        "drillTestDirDatetime" : {
          "location" : "/drill/testdata/datetime/datasources",
          "writable" : true,
          "storageformat" : "null"
        },
        "drillTestDirViews" : {
          "location" : "/drill/testdata/views/",
          "writable" : true,
          "storageformat" : "null"
        },
        "drillTestDirJson" : {
          "location" : "/drill/testdata/json_storage/datasources/",
          "writable" : true,
          "storageformat" : "null"
        },
        "drillTestDirCastedTable" : {
          "location" : "/drill/testdata/casted_table/datasources/",
          "writable" : true,
          "storageformat" : "null"
        },
        "drillTestDirAggregate" : {
          "location" : "/drill/testdata/aggregate/datasources/",
          "writable" : true,
          "storageformat" : "null"
        },
        "drillTestDirConvert" : {
          "location" : "/drill/testdata/convert/datasources/",
          "writable" : true,
          "storageformat" : "null"
        },
        "drillTestDirDecimal" : {
          "location" : "/drill/testdata/decimal/datasources/",
          "writable" : true,
          "storageformat" : "null"
        },
        "drillTestDirJoin" : {
          "location" : "/drill/testdata/join/datasources/",
          "writable" : true,
          "storageformat" : "null"
        },
        "drillTestDirOrderBy" : {
          "location" : "/drill/testdata/orderby/datasources/",
          "writable" : true,
          "storageformat" : "null"
        },
        "drillTestDirUdfs" : {
          "location" : "/drill/testdata/udfs",
          "writable" : true,
          "storageformat" : "null"
        },
        "drillTestDirHbaseView" : {
          "location" : "/drill/testdata/hbaseview/datasources/",
          "writable" : true,
          "storageformat" : "null"
        },
        "drillTestDirText" : {
          "location" : "/drill/testdata/text_storage/",
          "writable" : true,
          "storageformat" : "null"
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
          "delimiter" : "t"
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
    "selectionRoot" : "/drill/testdata/json_storage/datasources/input2.json",
    "cost" : 0.0
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`EXPR$0`",
      "expr" : "cast( (convert_to(`z`, \"JSON\") ) as VARCHAR(30) )"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  } ]
}