set -x

hadoop fs -ls /tmp
hadoop fs -rm -r /tmp/ldapfiles
hadoop fs -ls /tmp
hadoop fs -put -p /tmp/ldapfiles /tmp
hadoop fs -ls /tmp

hadoop fs -rm -r /tmp/linuxfiles
hadoop fs -ls /tmp
hadoop fs -put -p /tmp/linuxfiles /tmp
hadoop fs -ls /tmp
