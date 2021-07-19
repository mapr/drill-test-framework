#!/bin/bash
echo $BASHPID >> /tmp/scriptPID.lis


if [ "`pwd`" != "/root" ]
then
  cd framework/resources/Functional/maprdbbinary/maprdbbinaryfiles/
fi
. ./header.sh
./getMaprPass.sh
./execScriptOnPod.sh admincli-0 btadmincli.sh

./removePID.sh
