kubectl exec -i admincli-0 -n dataplatform -- bash -c "/bin/rm /tmp/linuxuser11.output; /tmp/linuxfiles/testscript.linuxuser11.sh > /tmp/linuxuser11.output 2>&1; cat /tmp/linuxuser11.output"
