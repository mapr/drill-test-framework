    Screen
      Project(EXPR$0=[/(CAST($1):INTEGER, CAST($2):FLOAT)])
        SelectionVectorRemover
          Filter(condition=[=($0, 10)])
            Project(row_key=[$0], ITEM=[ITEM($1, 'age')], ITEM2=[ITEM($2, 'gpa')])
              Scan(groupscan=[HBaseGroupScan [HBaseScanSpec=HBaseScanSpec [tableName=student, startRow=null, stopRow=null, filter=null], columns=[`row_key`, `twocf`.`age`, `threecf`.`gpa`]]])
