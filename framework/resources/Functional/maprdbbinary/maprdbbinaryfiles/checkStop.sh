#!/bin/bash
stopFile=/tmp/stopFile
if [ -f $stopFile ]
  then
  echo stopFile exists, stopping
  exit
fi
