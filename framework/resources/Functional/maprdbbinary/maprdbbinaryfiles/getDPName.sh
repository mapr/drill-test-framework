#!/bin/bash
if [ -f maprticket_5000 ]
  then
  cat maprticket_5000 | cut -d " " -f 1
else
  kubectl get pods -A | grep admincli | cut -d " " -f 1
fi
