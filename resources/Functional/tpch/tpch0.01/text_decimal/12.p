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
    "@id" : 10,
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
    "columns" : [ "`columns`[0]", "`columns`[5]" ],
    "selectionRoot" : "/drill/testdata/json_storage/orders.tbl",
    "cost" : 1605.0
  }, {
    "pop" : "project",
    "@id" : 8,
    "exprs" : [ {
      "ref" : "`o_orderkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`o_orderpriority`",
      "expr" : "`columns`[5]"
    } ],
    "child" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1605.0
  }, {
    "pop" : "fs-scan",
    "@id" : 12,
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
    "@id" : 11,
    "child" : 12,
    "expr" : "booleanAnd(booleanOr(equal(`columns`[14], 'TRUCK') , equal(`columns`[14], 'REG AIR') ) , less_than(cast( (`columns`[11] ) as DATE ), cast( (`columns`[12] ) as DATE )) , less_than(cast( (`columns`[10] ) as DATE ), cast( (`columns`[11] ) as DATE )) , greater_than_or_equal_to(cast( (`columns`[12] ) as DATE ), cast( 757382400000 as DATE)) , less_than(cast( (`columns`[12] ) as DATE ), add(cast( 757382400000 as DATE), cast( 'P12M' as INTERVALYEAR)) ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 109.921875
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 9,
    "child" : 11,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 109.921875
  }, {
    "pop" : "project",
    "@id" : 7,
    "exprs" : [ {
      "ref" : "`l_orderkey`",
      "expr" : "cast( (`columns`[0] ) as INT )"
    }, {
      "ref" : "`l_shipmode`",
      "expr" : "`columns`[14]"
    } ],
    "child" : 9,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 109.921875
  }, {
    "pop" : "hash-join",
    "@id" : 6,
    "left" : 8,
    "right" : 7,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`o_orderkey`",
      "right" : "`l_orderkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1605.0
  }, {
    "pop" : "project",
    "@id" : 5,
    "exprs" : [ {
      "ref" : "`l_shipmode`",
      "expr" : "`l_shipmode`"
    }, {
      "ref" : "`$f1`",
      "expr" : " ( if (booleanOr(equal(cast( (`o_orderpriority` ) as VARCHAR(8) ), '1-URGENT') , equal(cast( (`o_orderpriority` ) as VARCHAR(6) ), '2-HIGH') )  ) then (1 )  else (0 )  end  ) "
    }, {
      "ref" : "`$f2`",
      "expr" : " ( if (booleanAnd(not_equal(cast( (`o_orderpriority` ) as VARCHAR(8) ), '1-URGENT') , not_equal(cast( (`o_orderpriority` ) as VARCHAR(6) ), '2-HIGH') )  ) then (1 )  else (0 )  end  ) "
    } ],
    "child" : 6,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1605.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 4,
    "child" : 5,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 802.5,
    "groupByExprs" : [ {
      "ref" : "`l_shipmode`",
      "expr" : "`l_shipmode`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`high_line_count`",
      "expr" : "sum(`$f1`) "
    }, {
      "ref" : "`low_line_count`",
      "expr" : "sum(`$f2`) "
    } ]
  }, {
    "pop" : "external-sort",
    "@id" : 3,
    "child" : 4,
    "orderings" : [ {
      "order" : "ASC",
      "expr" : "`l_shipmode`",
      "nullDirection" : "UNSPECIFIED"
    } ],
    "reverse" : false,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 160.5
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 2,
    "child" : 3,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 160.5
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`l_shipmode`",
      "expr" : "`l_shipmode`"
    }, {
      "ref" : "`high_line_count`",
      "expr" : "`high_line_count`"
    }, {
      "ref" : "`low_line_count`",
      "expr" : "`low_line_count`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 160.5
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 160.5
  } ]
}