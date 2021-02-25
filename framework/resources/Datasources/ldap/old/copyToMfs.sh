set -x

echo "mapr" | maprlogin password -user root
hadoop fs -ls /tmp
hadoop fs -rm -r /tmp/ldapfiles
hadoop fs -ls /tmp
hadoop fs -put -p /tmp/ldapfiles /tmp
hadoop fs -ls /tmp
