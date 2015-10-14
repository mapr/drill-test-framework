#!/bin/bash
hbase shell << EOF
disable 'student'
drop 'student'
disable 'voter'
drop 'voter'
create 'student','onecf','twocf','threecf','fourcf','fivecf'
create 'voter', 'onecf', 'twocf', 'threecf', 'fourcf', {SPLITS => ['1','2','3','4','5','6','7','8','9']}
exit
EOF
