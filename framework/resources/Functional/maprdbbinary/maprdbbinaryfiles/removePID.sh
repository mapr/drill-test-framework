#!/bin/bash
sl=/tmp/scriptPID.lis
sl2=/tmp/scriptPID2.lis
cat $sl | grep -v $$ > $sl2
mv $sl2 $sl
