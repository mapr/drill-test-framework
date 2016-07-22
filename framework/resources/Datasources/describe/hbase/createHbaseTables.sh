#!/bin/bash
hbase shell << EOF
disable 'student_describe'
drop 'student_describe'
create 'student_describe','onecf','twocf','threecf','fourcf','fivecf'
exit
EOF
