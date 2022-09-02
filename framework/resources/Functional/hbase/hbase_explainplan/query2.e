		Screen
			Project(EXPR$0=[/(CAST(ITEM($0, 'age')):INTEGER, CAST(ITEM($1, 'gpa')):FLOAT)])
                Scan(table=[[hbase, student]], groupscan=[HBaseGroupScan [HBaseScanSpec=HBaseScanSpec [tableName="student", startRow="10", stopRow="10\x00"], columns=[`twocf`.`age`, `threecf`.`gpa`]]])
