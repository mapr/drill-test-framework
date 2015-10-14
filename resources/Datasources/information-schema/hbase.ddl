disable 'hbase-students'
drop 'hbase-students'
create 'hbase-students', 'cf1', 'cf2', 'cf3'

disable 'hbase-employee'
drop 'hbase-employee'
create 'hbase-employee', 'bio','work'
put 'hbase-employee', 'empId-1', 'bio:name', 'sid'
put 'hbase-employee', 'empId-1', 'work:designation', 'Database Architect'

