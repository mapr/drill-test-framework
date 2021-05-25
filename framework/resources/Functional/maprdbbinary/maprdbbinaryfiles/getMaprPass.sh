. ./header.sh

epass=`kubectl get secret system -n $cname -o yaml | grep MAPR_PASSWORD | head -n 1 | awk '{ print $2 }'`
upass=`echo "${epass}" | base64 --decode`
echo $upass > /tmp/MaprPasswd
