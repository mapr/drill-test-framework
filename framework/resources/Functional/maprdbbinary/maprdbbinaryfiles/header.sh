#output several blank lines to screen for visual seperator
count=0
while [ $count -lt 20 ]
do
  count=$((count+1))
  echo ""
done

echo "`date` executing $0"

if [ -f ./getDPName.sh ]
  then
  export cname=`./getDPName.sh`
fi
