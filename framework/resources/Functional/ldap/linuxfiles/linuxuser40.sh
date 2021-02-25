kubectl exec -i admincli-0 -n dataplatform -- bash -c "/bin/rm /tmp/linuxuser40.output; /tmp/linuxfiles/testscript.linuxuser40.sh > /tmp/linuxuser40.output 2>&1; cat /tmp/linuxuser40.output"
