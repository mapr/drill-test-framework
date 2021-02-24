kubectl exec -i admincli-0 -n dataplatform -- bash -c "/bin/rm /tmp/linuxuser2.output; /tmp/linuxfiles/testscript.linuxuser2.sh > /tmp/linuxuser2.output 2>&1; cat /tmp/linuxuser2.output"
