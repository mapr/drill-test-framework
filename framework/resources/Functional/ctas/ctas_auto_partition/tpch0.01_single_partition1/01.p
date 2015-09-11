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
    "@id" : 8,
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
    "pop" : "filter",
    "@id" : 7,
    "child" : 8,
    "expr" : "less_than_or_equal_to(`l_shipdate`, subtract(cast( 912470400000 as DATE), cast( 'P120D' as INTERVALDAY)) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13008.0
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 6,
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13008.0
  }, {
    "pop" : "project",
    "@id" : 5,
    "exprs" : [ {
      "ref" : "`l_returnflag`",
      "expr" : "`l_returnflag`"
    }, {
      "ref" : "`l_linestatus`",
      "expr" : "`l_linestatus`"
    }, {
      "ref" : "`l_quantity`",
      "expr" : "`l_quantity`"
    }, {
      "ref" : "`l_extendedprice`",
      "expr" : "`l_extendedprice`"
    }, {
      "ref" : "`$f4`",
      "expr" : "multiply(`l_extendedprice`, subtract(1, `l_discount`) ) "
    }, {
      "ref" : "`$f5`",
      "expr" : "multiply(multiply(`l_extendedprice`, subtract(1, `l_discount`) ) , add(1, `l_tax`) ) "
    }, {
      "ref" : "`l_discount`",
      "expr" : "`l_discount`"
    } ],
    "child" : 6,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 13008.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 4,
    "child" : 5,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 9756.0,
    "groupByExprs" : [ {
      "ref" : "`l_returnflag`",
      "expr" : "`l_returnflag`"
    }, {
      "ref" : "`l_linestatus`",
      "expr" : "`l_linestatus`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`sum_qty`",
      "expr" : "sum(`l_quantity`) "
    }, {
      "ref" : "`sum_base_price`",
      "expr" : "sum(`l_extendedprice`) "
    }, {
      "ref" : "`sum_disc_price`",
      "expr" : "sum(`$f4`) "
    }, {
      "ref" : "`sum_charge`",
      "expr" : "sum(`$f5`) "
    }, {
      "ref" : "`avg_qty`",
      "expr" : "avg(`l_quantity`) "
    }, {
      "ref" : "`avg_price`",
      "expr" : "avg(`l_extendedprice`) "
    }, {
      "ref" : "`avg_disc`",
      "expr" : "avg(`l_discount`) "
    }, {
      "ref" : "`count_order`",
      "expr" : "count(1) "
    } ]
  }, {
    "pop" : "external-sort",
    "@id" : 3,
    "child" : 4,
    "orderings" : [ {
      "order" : "ASC",
      "expr" : "`l_returnflag`",
      "nullDirection" : "UNSPECIFIED"
    }, {
      "order" : "ASC",
      "expr" : "`l_linestatus`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
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
      "ref" : "`l_returnflag`",
      "expr" : "`l_returnflag`"
    }, {
      "ref" : "`l_linestatus`",
      "expr" : "`l_linestatus`"
    }, {
      "ref" : "`sum_qty`",
      "expr" : "`sum_qty`"
    }, {
      "ref" : "`sum_base_price`",
      "expr" : "`sum_base_price`"
    }, {
      "ref" : "`sum_disc_price`",
      "expr" : "`sum_disc_price`"
    }, {
      "ref" : "`sum_charge`",
      "expr" : "`sum_charge`"
    }, {
      "ref" : "`avg_qty`",
      "expr" : "`avg_qty`"
    }, {
      "ref" : "`avg_price`",
      "expr" : "`avg_price`"
    }, {
      "ref" : "`avg_disc`",
      "expr" : "`avg_disc`"
    }, {
      "ref" : "`count_order`",
      "expr" : "`count_order`"
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