sl=/tmp/scriptPID.lis
sl2=/tmp/scriptPID2.lis
cat $sl | grep -v $BASHPID > $sl2
mv $sl2 $sl
