    Screen
      Project(student_id=[CAST($0):INTEGER NOT NULL], name=[CAST(ITEM($3, 'name')):VARCHAR(30) CHARACTER SET "ISO-8859-1" COLLATE "ISO-8859-1$en_US$primary"], age=[CAST(ITEM($5, 'age')):INTEGER], gpa=[CAST(ITEM($4, 'gpa')):DECIMAL(4, 2)], student_num=[CAST(ITEM($2, 'studentnum')):BIGINT], create_date=[CAST(ITEM($1, 'create_date')):TIMESTAMP(0)])
        Scan(groupscan=[HBaseGroupScan [HBaseScanSpec=HBaseScanSpec [tableName=student, startRow=750\x00, stopRow=800, filter=FilterList AND (2/2): [RowFilter (LESS, 800), RowFilter (GREATER, 750)]], columns=[`*`]]])
