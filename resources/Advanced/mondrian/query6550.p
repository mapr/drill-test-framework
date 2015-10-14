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
    "pop" : "parquet-scan",
    "@id" : 24,
    "entries" : [ {
      "path" : "maprfs:/user/root/mondrian/sales_fact_1997"
    } ],
    "storage" : {
      "type" : "file",
      "enabled" : true,
      "connection" : "maprfs:///",
      "workspaces" : {
        "default" : {
          "location" : "/user/root/mondrian/",
          "writable" : false,
          "storageformat" : null
        },
        "home" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "root" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "tmp" : {
          "location" : "/tmp",
          "writable" : true,
          "storageformat" : "csv"
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
      "type" : "parquet"
    },
    "columns" : [ "`time_id`", "`product_id`", "`customer_id`", "`unit_sales`" ],
    "selectionRoot" : "/user/root/mondrian/sales_fact_1997",
    "cost" : 86837.0
  }, {
    "pop" : "project",
    "@id" : 20,
    "exprs" : [ {
      "ref" : "`time_id`",
      "expr" : "`time_id`"
    }, {
      "ref" : "`product_id`",
      "expr" : "`product_id`"
    }, {
      "ref" : "`customer_id`",
      "expr" : "`customer_id`"
    }, {
      "ref" : "`unit_sales`",
      "expr" : "`unit_sales`"
    } ],
    "child" : 24,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 86837.0
  }, {
    "pop" : "project",
    "@id" : 16,
    "exprs" : [ {
      "ref" : "`time_id0`",
      "expr" : "`time_id`"
    }, {
      "ref" : "`product_id`",
      "expr" : "`product_id`"
    }, {
      "ref" : "`customer_id`",
      "expr" : "`customer_id`"
    }, {
      "ref" : "`unit_sales`",
      "expr" : "`unit_sales`"
    } ],
    "child" : 20,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 86837.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 12,
    "entries" : [ {
      "path" : "maprfs:/user/root/mondrian/customer"
    } ],
    "storage" : {
      "type" : "file",
      "enabled" : true,
      "connection" : "maprfs:///",
      "workspaces" : {
        "default" : {
          "location" : "/user/root/mondrian/",
          "writable" : false,
          "storageformat" : null
        },
        "home" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "root" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "tmp" : {
          "location" : "/tmp",
          "writable" : true,
          "storageformat" : "csv"
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
      "type" : "parquet"
    },
    "columns" : [ "`customer_id`" ],
    "selectionRoot" : "/user/root/mondrian/customer",
    "cost" : 10281.0
  }, {
    "pop" : "filter",
    "@id" : 9,
    "child" : 12,
    "expr" : "equal(cast( (`customer_id` ) as INT ), 5219) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1542.1499999999999
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 7,
    "child" : 9,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1542.1499999999999
  }, {
    "pop" : "project",
    "@id" : 5,
    "exprs" : [ {
      "ref" : "`customer_id0`",
      "expr" : "`customer_id`"
    } ],
    "child" : 7,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1542.1499999999999
  }, {
    "pop" : "parquet-scan",
    "@id" : 28,
    "entries" : [ {
      "path" : "maprfs:/user/root/mondrian/time_by_day"
    } ],
    "storage" : {
      "type" : "file",
      "enabled" : true,
      "connection" : "maprfs:///",
      "workspaces" : {
        "default" : {
          "location" : "/user/root/mondrian/",
          "writable" : false,
          "storageformat" : null
        },
        "home" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "root" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "tmp" : {
          "location" : "/tmp",
          "writable" : true,
          "storageformat" : "csv"
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
      "type" : "parquet"
    },
    "columns" : [ "`the_year`", "`quarter`", "`month_of_year`", "`time_id`" ],
    "selectionRoot" : "/user/root/mondrian/time_by_day",
    "cost" : 730.0
  }, {
    "pop" : "project",
    "@id" : 25,
    "exprs" : [ {
      "ref" : "`the_year`",
      "expr" : "`the_year`"
    }, {
      "ref" : "`quarter`",
      "expr" : "`quarter`"
    }, {
      "ref" : "`month_of_year`",
      "expr" : "`month_of_year`"
    }, {
      "ref" : "`time_id`",
      "expr" : "`time_id`"
    } ],
    "child" : 28,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 730.0
  }, {
    "pop" : "filter",
    "@id" : 21,
    "child" : 25,
    "expr" : "booleanAnd(equal(cast( (`the_year` ) as INT ), 1997) , booleanOr(equal(`quarter`, 'Q1') , equal(`quarter`, 'Q2') ) , booleanOr(equal(`month_of_year`, 2) , equal(`month_of_year`, 3) , equal(`month_of_year`, 4) , equal(`month_of_year`, 5) ) ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 6.84375
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 17,
    "child" : 21,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 6.84375
  }, {
    "pop" : "hash-join",
    "@id" : 13,
    "left" : 17,
    "right" : 16,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`time_id`",
      "right" : "`time_id0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 0.0
  }, {
    "pop" : "project",
    "@id" : 10,
    "exprs" : [ {
      "ref" : "`the_year`",
      "expr" : "`the_year`"
    }, {
      "ref" : "`quarter`",
      "expr" : "`quarter`"
    }, {
      "ref" : "`month_of_year`",
      "expr" : "`month_of_year`"
    }, {
      "ref" : "`time_id`",
      "expr" : "`time_id`"
    }, {
      "ref" : "`time_id0`",
      "expr" : "`time_id0`"
    }, {
      "ref" : "`product_id0`",
      "expr" : "`product_id`"
    }, {
      "ref" : "`customer_id`",
      "expr" : "`customer_id`"
    }, {
      "ref" : "`unit_sales`",
      "expr" : "`unit_sales`"
    } ],
    "child" : 13,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 29,
    "entries" : [ {
      "path" : "maprfs:/user/root/mondrian/product_class"
    } ],
    "storage" : {
      "type" : "file",
      "enabled" : true,
      "connection" : "maprfs:///",
      "workspaces" : {
        "default" : {
          "location" : "/user/root/mondrian/",
          "writable" : false,
          "storageformat" : null
        },
        "home" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "root" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "tmp" : {
          "location" : "/tmp",
          "writable" : true,
          "storageformat" : "csv"
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
      "type" : "parquet"
    },
    "columns" : [ "`product_family`", "`product_department`", "`product_category`", "`product_subcategory`", "`product_class_id`" ],
    "selectionRoot" : "/user/root/mondrian/product_class",
    "cost" : 110.0
  }, {
    "pop" : "project",
    "@id" : 26,
    "exprs" : [ {
      "ref" : "`product_family`",
      "expr" : "`product_family`"
    }, {
      "ref" : "`product_department`",
      "expr" : "`product_department`"
    }, {
      "ref" : "`product_category`",
      "expr" : "`product_category`"
    }, {
      "ref" : "`product_subcategory`",
      "expr" : "`product_subcategory`"
    }, {
      "ref" : "`product_class_id`",
      "expr" : "`product_class_id`"
    } ],
    "child" : 29,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 110.0
  }, {
    "pop" : "filter",
    "@id" : 22,
    "child" : 26,
    "expr" : "booleanAnd(equal(cast( (`product_family` ) as VARCHAR(5) ), 'Drink') , equal(cast( (`product_department` ) as VARCHAR(19) ), 'Alcoholic Beverages') , equal(cast( (`product_category` ) as VARCHAR(13) ), 'Beer and Wine') , equal(cast( (`product_subcategory` ) as VARCHAR(4) ), 'Beer') ) ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 0.055687499999999994
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 18,
    "child" : 22,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "project",
    "@id" : 14,
    "exprs" : [ {
      "ref" : "`product_family`",
      "expr" : "`product_family`"
    }, {
      "ref" : "`product_department`",
      "expr" : "`product_department`"
    }, {
      "ref" : "`product_category`",
      "expr" : "`product_category`"
    }, {
      "ref" : "`product_subcategory`",
      "expr" : "`product_subcategory`"
    }, {
      "ref" : "`product_class_id0`",
      "expr" : "`product_class_id`"
    } ],
    "child" : 18,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "parquet-scan",
    "@id" : 27,
    "entries" : [ {
      "path" : "maprfs:/user/root/mondrian/product"
    } ],
    "storage" : {
      "type" : "file",
      "enabled" : true,
      "connection" : "maprfs:///",
      "workspaces" : {
        "default" : {
          "location" : "/user/root/mondrian/",
          "writable" : false,
          "storageformat" : null
        },
        "home" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "root" : {
          "location" : "/",
          "writable" : false,
          "storageformat" : null
        },
        "tmp" : {
          "location" : "/tmp",
          "writable" : true,
          "storageformat" : "csv"
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
      "type" : "parquet"
    },
    "columns" : [ "`brand_name`", "`product_class_id`", "`product_id`" ],
    "selectionRoot" : "/user/root/mondrian/product",
    "cost" : 1560.0
  }, {
    "pop" : "project",
    "@id" : 23,
    "exprs" : [ {
      "ref" : "`brand_name`",
      "expr" : "`brand_name`"
    }, {
      "ref" : "`product_class_id`",
      "expr" : "`product_class_id`"
    }, {
      "ref" : "`product_id`",
      "expr" : "`product_id`"
    } ],
    "child" : 27,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1560.0
  }, {
    "pop" : "filter",
    "@id" : 19,
    "child" : 23,
    "expr" : "equal(cast( (`brand_name` ) as VARCHAR(10) ), 'Portsmouth') ",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 234.0
  }, {
    "pop" : "selection-vector-remover",
    "@id" : 15,
    "child" : 19,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 234.0
  }, {
    "pop" : "hash-join",
    "@id" : 11,
    "left" : 15,
    "right" : 14,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`product_class_id`",
      "right" : "`product_class_id0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 0.0
  }, {
    "pop" : "hash-join",
    "@id" : 8,
    "left" : 11,
    "right" : 10,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`product_id`",
      "right" : "`product_id0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 0.0
  }, {
    "pop" : "project",
    "@id" : 6,
    "exprs" : [ {
      "ref" : "`the_year`",
      "expr" : "`the_year`"
    }, {
      "ref" : "`quarter`",
      "expr" : "`quarter`"
    }, {
      "ref" : "`month_of_year`",
      "expr" : "`month_of_year`"
    }, {
      "ref" : "`customer_id`",
      "expr" : "`customer_id`"
    }, {
      "ref" : "`unit_sales`",
      "expr" : "`unit_sales`"
    }, {
      "ref" : "`product_family`",
      "expr" : "`product_family`"
    }, {
      "ref" : "`product_department`",
      "expr" : "`product_department`"
    }, {
      "ref" : "`product_category`",
      "expr" : "`product_category`"
    }, {
      "ref" : "`product_subcategory`",
      "expr" : "`product_subcategory`"
    }, {
      "ref" : "`brand_name`",
      "expr" : "`brand_name`"
    } ],
    "child" : 8,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "hash-join",
    "@id" : 4,
    "left" : 6,
    "right" : 5,
    "conditions" : [ {
      "relationship" : "==",
      "left" : "`customer_id`",
      "right" : "`customer_id0`"
    } ],
    "joinType" : "INNER",
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 0.0
  }, {
    "pop" : "project",
    "@id" : 3,
    "exprs" : [ {
      "ref" : "`c0`",
      "expr" : "`the_year`"
    }, {
      "ref" : "`c1`",
      "expr" : "`quarter`"
    }, {
      "ref" : "`c2`",
      "expr" : "`month_of_year`"
    }, {
      "ref" : "`c3`",
      "expr" : "`product_family`"
    }, {
      "ref" : "`c4`",
      "expr" : "`product_department`"
    }, {
      "ref" : "`c5`",
      "expr" : "`product_category`"
    }, {
      "ref" : "`c6`",
      "expr" : "`product_subcategory`"
    }, {
      "ref" : "`c7`",
      "expr" : "`brand_name`"
    }, {
      "ref" : "`c8`",
      "expr" : "`customer_id0`"
    }, {
      "ref" : "`unit_sales`",
      "expr" : "`unit_sales`"
    } ],
    "child" : 4,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 1.0
  }, {
    "pop" : "hash-aggregate",
    "@id" : 2,
    "child" : 3,
    "cardinality" : 1.0,
    "initialAllocation" : 1000000,
    "maxAllocation" : 10000000000,
    "cost" : 0.998046875,
    "groupByExprs" : [ {
      "ref" : "`c0`",
      "expr" : "`c0`"
    }, {
      "ref" : "`c1`",
      "expr" : "`c1`"
    }, {
      "ref" : "`c2`",
      "expr" : "`c2`"
    }, {
      "ref" : "`c3`",
      "expr" : "`c3`"
    }, {
      "ref" : "`c4`",
      "expr" : "`c4`"
    }, {
      "ref" : "`c5`",
      "expr" : "`c5`"
    }, {
      "ref" : "`c6`",
      "expr" : "`c6`"
    }, {
      "ref" : "`c7`",
      "expr" : "`c7`"
    }, {
      "ref" : "`c8`",
      "expr" : "`c8`"
    } ],
    "aggrExprs" : [ {
      "ref" : "`m0`",
      "expr" : "sum(`unit_sales`) "
    } ]
  }, {
    "pop" : "project",
    "@id" : 1,
    "exprs" : [ {
      "ref" : "`c0`",
      "expr" : "`c0`"
    }, {
      "ref" : "`c1`",
      "expr" : "`c1`"
    }, {
      "ref" : "`c2`",
      "expr" : "`c2`"
    }, {
      "ref" : "`c3`",
      "expr" : "`c3`"
    }, {
      "ref" : "`c4`",
      "expr" : "`c4`"
    }, {
      "ref" : "`c5`",
      "expr" : "`c5`"
    }, {
      "ref" : "`c6`",
      "expr" : "`c6`"
    }, {
      "ref" : "`c7`",
      "expr" : "`c7`"
    }, {
      "ref" : "`c8`",
      "expr" : "`c8`"
    }, {
      "ref" : "`m0`",
      "expr" : "`m0`"
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