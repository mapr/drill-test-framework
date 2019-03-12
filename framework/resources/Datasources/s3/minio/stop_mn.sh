#!/bin/sh

if [ ! -z "$(top -bn1 |grep minio |grep -oE '^[ ]*[0-9]+' |grep -oE '[0-9]+')" ]
then
  kill -9 $(top -bn1 |grep minio |grep -oE '^[ ]*[0-9]+' |grep -oE '[0-9]+')
fi
