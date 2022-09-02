    Screen
      Project(EXPR$0=[/(CAST(ITEM($1, 'age')):INTEGER, CAST(ITEM($2, 'gpa')):FLOAT)])
        SelectionVectorRemover
          Filter(condition=[=($0, 10)])
            Scan(table=[[hbase, student]], groupscan=[HBaseGroupScan [HBaseScanSpec=HBaseScanSpec [tableName="student"], columns=[`row_key`, `twocf`.`age`, `threecf`.`gpa`]]])
