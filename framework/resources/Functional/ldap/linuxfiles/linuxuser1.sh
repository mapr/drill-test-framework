kubectl exec -i admincli-0 -n dataplatform -- bash -c "/bin/rm /tmp/linuxuser1.output; /tmp/linuxfiles/testscript.linuxuser1.sh > /tmp/linuxuser1.output 2>&1; cat /tmp/linuxuser1.output"
