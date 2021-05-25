echo $BASHPID >> /tmp/scriptPID.lis

. /tmp/header.sh

if [ "`pwd`" == "/root/drill-test-framework" ]
then
  cd /root/drill-test-framework/framework/resources/Functional/maprdbbinary/maprdbbinaryfiles/
fi
./execScriptOnPod.sh admincli-0 btadmincli.sh

./removePID.sh
