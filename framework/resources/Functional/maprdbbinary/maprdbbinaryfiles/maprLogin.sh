tf=/tmp/maprLogin.lis
cat << EOF | maprlogin password 2>&1 > $tf
`cat /tmp/MaprPasswd`
EOF
if [ $? -ne 0 ]
  then
  cat $tf
  echo `date` running script: $0, on `hostname` running as: `whoami`, using password `cat /tmp/MaprPasswd`
fi
rm -rf $tf

