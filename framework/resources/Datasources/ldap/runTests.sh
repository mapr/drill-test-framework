set -x

kubectl exec -i admincli-0 -n dataplatform -- /bin/bash -c 'cd /tmp/ldapfiles; sudo ./testscript.sh'

kubectl exec -i admincli-0 -n dataplatform -- /bin/bash -c 'cd /tmp/linuxfiles; sudo ./testscript.sh'

