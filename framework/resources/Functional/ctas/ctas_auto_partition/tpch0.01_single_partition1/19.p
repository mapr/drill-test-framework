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
    "@id" : 8,
    "exprs" : [ {
      "ref" : "`T93¦¦*`",
      "expr" : "`*`"
    } ],
    "child" : 10,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 26016.0
  }, {
    "pop" : "fs-scan",
    "@id" : 9,
    "files" : [ "maprfs:/drill/testdata/json_storage/part/part.json" ],
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
    "selectionRoot" : "/drill/testdata/json_storage/part",
    "cost" : 550.0
  }, {
    "pop" : "project",
    "@id" : 7,
    "exprs" : [ {
      "ref" : "`T94¦¦*`",
      "expr" : "`*`"
    } ],
    "child" : 9,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 550.0
  }, {
    "pop" : "hash-join",
    "@id" : 6,
    "left" : 8,
    "right" : 7,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`T93¦¦l_partkey`",
      "right" : "`T94¦¦p_partkey`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 26016.0
  }, {
    "pop" : "filter",
    "@id" : 5,
    "child" : 6,
    "expr" : "booleanOr(booleanAnd(equal(cast( (`T94¦¦p_brand` ) as VARCHAR(8) ), 'Brand#41') , booleanOr(equal(`T94¦¦p_container`, 'SM CASE') , equal(`T94¦¦p_container`, 'SM BOX') , equal(`T94¦¦p_container`, 'SM PACK') , equal(`T94¦¦p_container`, 'SM PKG') ) , greater_than_or_equal_to(`T93¦¦l_quantity`, 2) , less_than_or_equal_to(`T93¦¦l_quantity`, add(2, 10) ) , greater_than_or_equal_to(`T94¦¦p_size`, 1) , less_than_or_equal_to(`T94¦¦p_size`, 5) , booleanOr(equal(`T93¦¦l_shipmode`, 'AIR') , equal(`T93¦¦l_shipmode`, 'AIR REG') ) , equal(cast( (`T93¦¦l_shipinstruct` ) as VARCHAR(17) ), 'DELIVER IN PERSON') ) , booleanAnd(equal(cast( (`T94¦¦p_brand` ) as VARCHAR(8) ), 'Brand#13') , booleanOr(equal(`T94¦¦p_container`, 'MED BAG') , equal(`T94¦¦p_container`, 'MED BOX') , equal(`T94¦¦p_container`, 'MED PKG') , equal(`T94¦¦p_container`, 'MED PACK') ) , greater_than_or_equal_to(`T93¦¦l_quantity`, 14) , less_than_or_equal_to(`T93¦¦l_quantity`, add(14, 10) ) , greater_than_or_equal_to(`T94¦¦p_size`, 1) , less_than_or_equal_to(`T94¦¦p_size`, 10) , booleanOr(equal(`T93¦¦l_shipmode`, 'AIR') , equal(`T93¦¦l_shipmode`, 'AIR REG') ) , equal(cast( (`T93¦¦l_shipinstruct` ) as VARCHAR(17) ), 'DELIVER IN PERSON') ) , booleanAnd(equal(cast( (`T94¦¦p_brand` ) as VARCHAR(8) ), 'Brand#55') , booleanOr(equal(`T94¦¦p_container`, 'LG CASE') , equal(`T94¦¦p_container`, 'LG BOX') , equal(`T94¦¦p_container`, 'LG PACK') , equal(`T94¦¦p_container`, 'LG PKG') ) , greater_than_or_equal_to(`T93¦¦l_quantity`, 23) , less_than_or_equal_to(`T93¦¦l_quantity`, add(23, 10) ) , greater_than_or_equal_to(`T94¦¦p_size`, 1) , less_than_or_equal_to(`T94¦¦p_size`, 15) , booleanOr(equal(`T93¦¦l_shipmode`, 'AIR') , equal(`T93¦¦l_shipmode`, 'AIR REG') ) , equal(cast( (`T93¦¦l_shipinstruct` ) as VARCHAR(17) ), 'DELIVER IN PERSON') ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 6504.0
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 4,
    "child" : 5,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 6504.0
  }, {
    "pop" : "project",
    "@id" : 3,
    "exprs" : [ {
      "ref" : "`$f0`",
      "expr" : "multiply(`T93¦¦l_extendedprice`, subtract(1, `T93¦¦l_discount`) ) "
    } ],
    "child" : 4,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 6504.0
  }, {
    "pop" : "streaming-aggregate",
    "@id" : 2,
    "child" : 3,
    "keys" : [ ],
    "exprs" : [ {
      "ref" : "`revenue`",
      "expr" : "sum(`$f0`) "
    } ],
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`revenue`",
      "expr" : "`revenue`"
    } ],
    "child" : 2,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 650.4
  }, {
    "pop" : "screen",
    "@id" : 0,
    "child" : 1,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 650.4
  } ]
}