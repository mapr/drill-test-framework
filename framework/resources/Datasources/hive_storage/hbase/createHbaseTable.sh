#!/bin/bash
hbase shell << EOF

disable 'hbvoter'
drop 'hbvoter'
create 'hbvoter', 'onecf', 'twocf', 'threecf', 'fourcf', {SPLITS => ['1','2','3','4','5','6','7','8','9']}
exit
EOF
