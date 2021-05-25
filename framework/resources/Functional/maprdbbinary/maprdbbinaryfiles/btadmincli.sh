# script to be executed on the admincli pod to verify binary tables
echo $BASHPID >> /tmp/scriptPID.lis

ofile=/tmp/out.lis
ofile2=/tmp/out2.lis
ofile3=/tmp/out3.lis
count=0    # total number of command executions
dcount=0   # total number of command executions with known defects
ucount=0   # total number of unexpected failures

#hstr - hard string, may be difficult to handle as a field
hstr="1234567890-=\`\~\!\@\#\$\%\^\&\*)(_+qwertyuiop][}{\|\\asdfghjkl\;\’\:\”zxcvbnm\,\.\>\<\?你好"

lastxcmdstatus=/tmp/lastxcmdstatus.lis
# report command being executed, execute command, check status, cat output if error, output has been saved in file: /tmp/out.lis
# $1 the command to be executed
# $2 either EXACT    meaning a specific number of lines of output is expect
#        or EXPECTED meaning it is a known failure/defect
#        or NEGATIVE meaning it is a negative test
#        or IGNORE   meaning ignore number of lines returned
# $3 the number of lines of output expected, is only used if $2 is EXACT
# $4 either SHOULD    meaning output should have string specified in $5
#        or SHOULDNOT meaning output should not have string specified in $5
# $5 the string to check for in the output
# $6 unique identifier for this check - use $LINENO
function xchkcmd {
  . /tmp/checkStop.sh
  printf "."
  #echo /tmp/MaprPasswd for the login command, all other commands will simply ignore this
  echo /tmp/MaprPasswd | $1 >$ofile 2>&1
  status=$?
  #echo `date` executed command: $1 $2 $3 $4 $5 $6 return status: $status
  #cat $ofile
  echo $status > $lastxcmdstatus
  ((count++))
  # cat output without SLF4J - warning messages seen on all output
  cat $ofile | grep -v SLF4J > $ofile2
  # note add search for warnings "^WARNING: "
  mv $ofile2 $ofile
  if [ $status -ne 0 ] # if bad status returned
    then
    if [ "$2" == "EXPECTED" ] # known defect
      then
      ((dcount++))
    elif [ "$2" == "NEGATIVE" ] # negative testing where we expected a failure
      then
      # do nothing
      ignorethis=""
    else
      ((ucount++))
      echo $1 failed, return status: $status
      cat $ofile
    fi
  else # successful status returned
    if [ "$2" == "EXACT" ] #if expecting an exact number of lines of output
      then
      lines=`cat $ofile | wc -l`
      if [ "$3" != "$lines" ] # if we didn't get the number of lines expected
        then
        ((ucount++))
        echo $1 expected $3 lines of output but got $lines of output, output follows
        cat $ofile
      fi
    else   #this is the $2 IGNORE case
      if [ "$4" != "" ]   # if we are checking the output
        then
        grep "$5" $ofile >> /dev/null 2>&1 
        status=$?
      fi
      if [ "$4" == "SHOULD" ]
        then
        if [ $status -ne 0 ]
          then
          echo expected to find string $5 in output from $1 but did not, ID: $6, output follows:
          cat $ofile
        fi
      elif [ "$4" == "SHOULDNOT" ]
        then
        if [ $status -eq 0 ]
          then
          echo expected to not find string $5 in output from $1 but did, ID: $6, output follows:
          cat $ofile
        fi
      else
       # do nothing
       ignorethis=""
      fi
    fi
  fi
}

#verify that specified string is in the output
#1 - the command that was previously executed
#2 - the string to check for
#3 - the line number where this check is made: $LINENO
function verifyOutput {
  grep "$2" $ofile 2>&1 >> /dev/null
  if [ $? -ne 0 ]
    then
    # note add search for warnings "^WARNING: "
    echo "string not found ->$2<- from $3 in command execution output, of command: ->$1<-"
    echo command execution output follows:
    cat $ofile
   ((ucount++))
  fi 
}

sn=/tmp/hscript
#execute an hbase command
#$1 - the command to be executed, note multiple commands may be executed at once with CR/LF between each command
#$2 - if passed should exist in execution output
function xhbasecmd {
  . /tmp/checkStop.sh
  ((count++))
  echo -e "$1" > $sn
  echo "/usr/bin/hbase shell $sn 2>&1 > $ofile" > $ofile2
  echo "wait $!" >> $ofile2
  chmod u=rwx $ofile2
  $ofile2 2>&1 > /dev/null
  rm -rf $ofile2
  rm -rf $sn
  grep -e "^ERROR: " -e ArgumentError -e SyntaxError $ofile 2>&1 > /dev/null
  if [ $? -eq 0 ]
  then
   ((ucount++))
   #echo following hbase commands were executed: $1, output had errors, they follow:
   cat $ofile
  else
    printf "."
  fi
}

# note: configure.sh command does not appear to be available on either admincli or cldb, file a defect for this - see: https://docs.datafabric.hpe.com/62/ReferenceGuide/mapr-clusters.conf.html - defect filed
# note: command help options for table replica has a section for elastic search, but there is not documentation that references it - see: https://docs.datafabric.hpe.com/62/ReferenceGuide/tablereplica.html - defect filed
# maprlogin - login before cleanup
sh /tmp/maprLogin.sh
cd /tmp
cname=`./getDPName.sh`

td=/var/mapr/bttest
tp=$td/1
tp2=$td/2
tp3=$td/3
tp4=$td/4
st=/var/mapr/st
st2=$cl/2

#cleanup
function cleanup {
  xchkcmd "maprcli table delete -path $tp" EXPECTED
  xchkcmd "maprcli table delete -path $tp2" EXPECTED
  xchkcmd "maprcli table delete -path $tp3" EXPECTED
  xchkcmd "maprcli table delete -path $tp4" EXPECTED
  xchkcmd "maprcli table delete -path /tmp/weblog" EXPECTED
  xchkcmd "maprcli table delete -path /tmp/testtable" EXPECTED
  xchkcmd "maprcli table delete -path /tmp/a0" EXPECTED
  xchkcmd "maprcli volume snapshot remove -snapshotname tmpvolsnap -volume mapr.tmp" EXPECTED
  xchkcmd "maprcli table delete -path /tmp/t1" EXPECTED
  
  xchkcmd "hadoop fs -rmdir $td" EXPECTED
  rm -rf $ofile
  rm -rf $ofile2
  rm -rf $ofile3
  rm -rf $sn
}

cleanup

# cleanup logs us out, so login again
sh /tmp/maprLogin.sh

# create a table with data
# 1 - the table to be created
# 2 - the number of rows of data to create - takes about 1 min for every 15 rows
function tableData {
  . /tmp/checkStop.sh
  cmd="create '$tp', {NAME => 'cf1'}, {NAME => 'cf2'}, {NAME => 'nf1'}"
  xhbasecmd "$cmd"
  rcount=0
  ltp=$1
  while [ $rcount -lt $2 ]
    do
    rcount=$((rcount+1))
    rv1="row"$rcount"col1"
    rv2="row"$rcount"col2"
    cmd="\nput '$ltp','r$rcount','cf1:value','$rv1'"
    cmd=$cmd"\nput '$ltp','r$rcount','cf2:value','$rv2'"
    cmd=$cmd"\nput '$ltp','r1','nf1:value','$rcount'"
    rcount=$((rcount+1))
    rv1="row"$rcount"col1"
    rv2="row"$rcount"col2"
    cmd=$cmd"\nput '$ltp','r$rcount','cf1:value','$rv1'"
    cmd=$cmd"\nput '$ltp','r$rcount','cf2:value','$rv2'"
    cmd=$cmd"\nput '$ltp','r1','nf1:value','$rcount'"
    rcount=$((rcount+1))
    rv1="row"$rcount"col1"
    rv2="row"$rcount"col2"
    cmd=$cmd"\nput '$ltp','r$rcount','cf1:value','$rv1'"
    cmd=$cmd"\nput '$ltp','r$rcount','cf2:value','$rv2'"
    cmd=$cmd"\nput '$ltp','r1','nf1:value','$rcount'"
    count=$((count+9))
    xhbasecmd "$cmd"
  done
  cmd="\nscan '$ltp'"
  xhbasecmd "$cmd"
  verifyOutput "$cmd" "$rcount row" $LINENO
}

xchkcmd "hadoop fs -mkdir $td" EXPECTED

# execute maprcli table commands
function mt {
  xchkcmd "maprcli table create -path $tp" EXACT 0

  #create same table again
  xchkcmd "maprcli table create -path $tp" NEGATIVE

  xchkcmd "maprcli table cf list -path $tp" EXACT 0

  xchkcmd "maprcli table region list -path $tp" EXACT 2
  xchkcmd "maprcli table region pack -path $tp -fid all" EXACT 0
  xchkcmd "maprcli table region pack -path $tp -fid all -nthreads 1" EXACT 0
  xchkcmd "maprcli table region pack -path $tp -fid all -nthreads 160" EXACT 0
  xchkcmd "maprcli table region stat -path $tp" EXACT 2
  xchkcmd "maprcli table region stat -path $tp -json" IGNORE
  xchkcmd "maprcli table replica list -path $tp" EXACT 0
  xchkcmd "maprcli table changelog list -path $tp" EXACT 0
  cmd="maprcli table info -path $tp -json"
  xchkcmd "$cmd" IGNORE
  verifyOutput "$cmd" "\"autosplit\":true," $LINENO
  verifyOutput "$cmd" "\"regionsizemb\":4096," $LINENO
  verifyOutput "$cmd" "\"bulkload\":false," $LINENO
  verifyOutput "$cmd" "\"audit\":false," $LINENO
  verifyOutput "$cmd" "\"tabletype\":\"binary\"," $LINENO
  verifyOutput "$cmd" "\"metricsinterval\":60," $LINENO
  xchkcmd "maprcli table cf create -path $tp -cfname bttest1" EXACT 0
  cmd="maprcli table cf list -path $tp -cfname bttest1 -json"
  xchkcmd "$cmd" IGNORE
  verifyOutput "$cmd" "\"maxversions\":1," $LINENO
  verifyOutput "$cmd" "\"minversions\":0," $LINENO
  verifyOutput "$cmd" "\"ttl\":2147483647," $LINENO
  verifyOutput "$cmd" "\"inmemory\":false," $LINENO
  verifyOutput "$cmd" "\"compression\":\"lz4\"," $LINENO
  xchkcmd "maprcli table cf colperm get -path $tp -cfname bttest1 -json" EXACT 9
  xchkcmd "maprcli table cf edit -path $tp -cfname bttest1 -newcfname bttest2 -minversions 2 -maxversions 3 -ttl 400 -inmemory true -compression lzf" EXACT 0
  xchkcmd "maprcli table cf list -path $tp -cfname bttest1" NEGATIVE
  cmd="maprcli table cf list -path $tp -cfname bttest2 -json"
  xchkcmd "$cmd" IGNORE
  verifyOutput "$cmd" "\"maxversions\":3," $LINENO
  verifyOutput "$cmd" "\"minversions\":2," $LINENO
  verifyOutput "$cmd" "\"ttl\":400," $LINENO
  verifyOutput "$cmd" "\"inmemory\":true," $LINENO
  verifyOutput "$cmd" "\"compression\":\"lzf\"," $LINENO
  xchkcmd "maprcli table cf edit -path $tp -cfname bttest2 -compression zlib" EXACT 0
  cmd="maprcli table cf list -path $tp -cfname bttest2 -json"
  xchkcmd "$cmd" IGNORE
  verifyOutput "$cmd" "\"maxversions\":3," $LINENO
  verifyOutput "$cmd" "\"minversions\":2," $LINENO
  verifyOutput "$cmd" "\"ttl\":400," $LINENO
  verifyOutput "$cmd" "\"inmemory\":true," $LINENO
  verifyOutput "$cmd" "\"compression\":\"zlib\"," $LINENO
  xchkcmd "maprcli table listrecent" IGNORE
  xchkcmd "maprcli table upstream list -path $tp" EXACT 0
  xchkcmd "maprcli table cf create -path $tp -cfname bttest3 -minversions 1 -maxversions 2 -ttl 300 -inmemory true -compression off" EXACT 0
  cmd="maprcli table cf list -path $tp -cfname bttest3 -json"
  xchkcmd "$cmd" IGNORE
  verifyOutput "$cmd" "\"maxversions\":2," $LINENO
  verifyOutput "$cmd" "\"minversions\":1," $LINENO
  verifyOutput "$cmd" "\"ttl\":300," $LINENO
  verifyOutput "$cmd" "\"inmemory\":true," $LINENO
  verifyOutput "$cmd" "\"compression\":\"off\"," $LINENO

  # indexes not supported on binary tables
  xchkcmd "maprcli table index list -path $tp" NEGATIVE

  xchkcmd "maprcli table create -path $tp2 -copymetafrom $tp -copymetatype cfs,aces,splits,attrs -regionsizemb 500 -autosplit false -bulkload true -audit true -tabletype binary -metricsinterval 10" EXACT 5
  cmd="maprcli table info -path $tp2 -json"
  xchkcmd "$cmd" IGNORE
  verifyOutput "$cmd" "\"regionsizemb\":4096," $LINENO   #uses default value when autosplit is set to false
  verifyOutput "$cmd" "\"bulkload\":true," $LINENO
  verifyOutput "$cmd" "\"tabletype\":\"binary\"," $LINENO

  xchkcmd "maprcli table edit -path $tp2 -regionsizemb 501 -autosplit false -bulkload false -audit true  -metricsinterval 600 -deletettl 300" EXACT 0
  cmd="maprcli table info -path $tp2 -json"
  xchkcmd "$cmd" IGNORE
  # note regionsizemb should be ignored when autosplit is set to false, value should be 4096 - defect filed
  verifyOutput "$cmd" "\"regionsizemb\":501," $LINENO   #uses default value when autosplit is set to false
  verifyOutput "$cmd" "\"bulkload\":false," $LINENO
  verifyOutput "$cmd" "\"tabletype\":\"binary\"," $LINENO
  verifyOutput "$cmd" "\"deletettl\":300," $LINENO

  # note table edit command allows changing value of indexperm but it is not displayed via table info command - log defect
  # admin not a valid username so next command returns an error
  xchkcmd "maprcli table edit -path $tp2 -indexperm u:mapr,u:admin" NEGATIVE
  # unknown user errors returned for any other user specified here: root, admin, metrics, all of which are on the system - defect logged
  # also tried creating a new user- sudo su useradd nu -g mapr, userdel -r nu
  # uncomment next 4 lines when this defect is fixed
  #xchkcmd "maprcli table edit -path $tp2 -indexperm u:mapr,u:metrics" EXACT 0
  #cmd="maprcli table info -path $tp2 -json"
  #xchkcmd "$cmd" IGNORE
  #verifyOutput "$cmd" "\"indexperm\":\"u:mapr,u:metrics\"," $LINENO
  xchkcmd "maprcli table delete -path $tp2" EXACT 0

  xchkcmd "maprcli table cf delete -path $tp -cfname bttest2" EXACT 0
  xchkcmd "maprcli table cf delete -path $tp -cfname bttest3" EXACT 0
  xchkcmd "maprcli table delete -path $tp" EXACT 0

  #delete same table again
  xchkcmd "maprcli table delete -path $tp" NEGATIVE

  xchkcmd "maprcli table listrecent" IGNORE
}

mt

cmd="create '$tp', {NAME => 'cf1'}, {NAME => 'cf2'}, {NAME => 'nf1'}"
cmd=$cmd"\nput '$tp','r1','cf1:value','row1col1'"
cmd=$cmd"\nput '$tp','r1','cf2:value','row1col2'"
cmd=$cmd"\nput '$tp','r1','nf1:value','1'"
cmd=$cmd"\nput '$tp','r2','cf1:value','row2col1'"
cmd=$cmd"\nput '$tp','r2','cf2:value','row2col2'"
cmd=$cmd"\nput '$tp','r2','nf1:value','2'"
cmd=$cmd"\nexit"
count=$((count+6))
xhbasecmd "$cmd"
# note, next command should list column permission, it does not, defect filed
xchkcmd "maprcli table cf colperm get -path $tp -cfname cf1 -name value -json" EXACT 9
xchkcmd "maprcli table cf colperm set -path $tp -cfname cf1 -name value -readperm g:mapr" EXACT 0
xchkcmd "maprcli table cf colperm get -path $tp -cfname cf1 -name value -json" EXACT 12
xchkcmd "maprcli table cf colperm delete -path $tp -cfname cf1 -name value" EXACT 0
xchkcmd "maprcli table cf colperm get -path $tp -cfname cf1 -name value -json" EXACT 12
# note - securitypolicy is only supported for json tables - not binary tables
#xchkcmd "maprcli table cf column securitypolicy list -path $tp -cfname cf1 -json" EXACT 9
xchkcmd "maprcli table cf colperm get -path $tp -cfname cf1 -name value -json" EXACT 12
xchkcmd "maprcli node list -columns hostname" IGNORE
xchkcmd "maprcli cluster gateway local -format dns" EXACT 4
xchkcmd "maprcli cluster gateway local" EXACT 2
xchkcmd "maprcli cluster gateway list" EXACT 2
xchkcmd "maprcli cluster gateway get -dstcluster $cname" EXACT 2
xchkcmd "maprcli cluster gateway delete -dstcluster $cname" EXACT 0
xchkcmd "maprcli cluster gateway set -dstcluster $cname -gateways maprgateway-svc.$cname.svc.cluster.local" EXACT 0
xchkcmd "maprcli table replica autosetup -path $tp -replica $tp3" EXACT 0
# Ignore number of lines returned for next command - depends on how fast replication is
cmd="maprcli table replica list -path $tp -refreshnow true -json"
xchkcmd "$cmd" IGNORE
verifyOutput "$cmd" "$tp3" $LINENO
verifyOutput "$cmd" "\"synchronous\":false" $LINENO
verifyOutput "$cmd" "\"throttle\":false" $LINENO
verifyOutput "$cmd" "\"networkencryption\":false" $LINENO
verifyOutput "$cmd" "\"networkcompression\":\"lz4\"" $LINENO
# sleep to allow replication to complete
sleep 2
cmd="\nput '$tp','r5','cf1:value','row5col1'"
cmd=$cmd"\nput '$tp','r5','cf2:value','row5col2'"
cmd=$cmd"\nput '$tp','r5','nf1:value','5'"
cmd=$cmd"\nput '$tp','r6','cf1:value','row6col1'"
cmd=$cmd"\nput '$tp','r6','cf2:value','row6col2'"
cmd=$cmd"\nput '$tp','r6','nf1:value','6'"
cmd=$cmd"\nexit"
count=$((count+6))
xhbasecmd "$cmd"
cmd="scan '$tp'"
cmd=$cmd"\nexit"
xhbasecmd "$cmd"
verifyOutput "$cmd" "row6col2" $LINENO
sleep 120
cmd="maprcli table replica list -path $tp -json"
xchkcmd "$cmd" IGNORE
verifyOutput "$cmd" "copyTableCompletionPercentage\":100" $LINENO
cmd="\nscan '$tp3'"
cmd=$cmd"\nexit"
xhbasecmd "$cmd"
verifyOutput "$cmd" "row6col2" $LINENO

xchkcmd "maprcli table replica remove -path $tp -replica $tp3" EXACT 0
#table is not deleted with the replica remove
xchkcmd "maprcli table delete -path $tp3" EXACT 0
# note: Param useexistingreplica is supported only when param directcopy is set to true
# note: cannot use multi-master option with pre-existing replica table
# note: Failed to add replica for table: /var/mapr/bttest/1 DirectCopyInfo DC_NOT_SUPPORTED - it defaults to true - defect?
# note: above means can not use the useexistingreplica option
# note: next command gives several lines of warnings - output of 5 - defect filed
# note: ERROR (95) -  Failed to add replica for table: /var/mapr/bttest/1 DirectCopyInfo DC_NOT_SUPPORTED - when not specified defaults to true, when specified as false, still get this error - defect filed
#xchkcmd "maprcli table replica autosetup -path $tp -replica $tp4 -columns cf1:value -synchronous true -multimaster true -throttle true -networkencryption true -networkcompression zlib -directcopy false" EXACT 5
#cmd="maprcli table replica list -path $tp -refreshnow true -json"
#xchkcmd "$cmd" EXACT 33
#verifyOutput "$cmd" "$tp4" $LINENO
#verifyOutput "$cmd" "value" $LINENO
#verifyOutput "$cmd" "\"synchronous\":true" $LINENO
#verifyOutput "$cmd" "\"throttle\":true" $LINENO
#verifyOutput "$cmd" "\"networkencryption\":true" $LINENO
#verifyOutput "$cmd" "\"networkcompression\":\"zlib\"" $LINENO
#xchkcmd "maprcli table replica remove -path $tp -replica $tp4" EXACT 0
#xchkcmd "maprcli table delete -path $tp4" EXACT 0
#xchkcmd "maprcli table create -path $tp4" EXACT 0
#xchkcmd "maprcli table upstream add -path $tp4 -upstream $tp" EXACT 0
#xchkcmd "maprcli table upstream list -path $tp4" EXACT 2
#xchkcmd "maprcli table upstream remove -path $tp4 -upstream $tp" EXACT 0
#xchkcmd "maprcli table upstream list -path $tp4" EXACT 0
#xchkcmd "maprcli table delete -path $tp4" EXACT 0
# note following returns a warning, so we get one line of output - defect filed
xchkcmd "maprcli stream create -path $st" EXACT 1
# note next command returns an error - defect filed
#xchkcmd "maprcli table changelog add -path $tp -changelog $st:tn" EXACT 0
xchkcmd "maprcli table changelog list -path $tp" EXACT 0
cmd="maprcli table changelog list -path $tp -json"
xchkcmd "$cmd" EXACT 9
# note following are commented out until changelog add is working
#verifyOutput "$cmd" "\"useexistingtopic\":false" $LINENO
#verifyOutput "$cmd" "\"propagateexistingdata\":true" $LINENO
#verifyOutput "$cmd" "\"paused\":false" $LINENO
#verifyOutput "$cmd" "\"throttle\":false" $LINENO
#verifyOutput "$cmd" "\"synchronous\":false" $LINENO
#verifyOutput "$cmd" "\"networkencryption\":false" $LINENO
#verifyOutput "$cmd" "\"networkcompression\":\"lz4\"" $LINENO
#xchkcmd "maprcli table changelog remove -path $tp -changelog $st" EXACT 0
# note next commands are commented out due to defects above
#xchkcmd "maprcli table changelog add -path $tp -changelog $st:tn -columns cf1 -propagateexistingdata false -paused true -throttle true -synchronous true -networkencryption true -networkcompression off" EXACT 0
#xchkcmd "$cmd" EXACT 0
#verifyOutput "$cmd" "$cl" $LINENO
#verifyOutput "$cmd" "cf1" $LINENO
#verifyOutput "$cmd" "\"useexistingtopic\":false" $LINENO
#verifyOutput "$cmd" "\"propagateexistingdata\":false" $LINENO
#verifyOutput "$cmd" "\"paused\":true" $LINENO
#verifyOutput "$cmd" "\"throttle\":true" $LINENO
#verifyOutput "$cmd" "\"synchronous\":true" $LINENO
#verifyOutput "$cmd" "\"networkencryption\":true" $LINENO
#verifyOutput "$cmd" "\"networkcompression\":\"off\"" $LINENO
#xchkcmd "maprcli table changelog remove -path $tp -changelog $cl" EXACT 0
xchkcmd "maprcli stream delete -path $st" EXACT 0
cmd="\nscan '$tp'"
cmd=$cmd"\nversion"
cmd=$cmd"\nlist '$tp'"
cmd=$cmd"\nis_enabled '$tp'"
cmd=$cmd"\nexists '$tp'"
cmd=$cmd"\ndisable '$tp'"
cmd=$cmd"\ndrop '$tp'"
cmd=$cmd"\nexit"
count=$((count+6))
xhbasecmd "$cmd"
verifyOutput "$cmd" "row6col2" $LINENO
verifyOutput "$cmd" "does exist" $LINENO
verifyOutput "$cmd" " r6 column=nf1:value, timestamp=" $LINENO

#note defect filed for process and status commands - status command is not supported, process command is in neither the supported or unsupported list - if commands are not supported they should not be in the usage message - see: https://docs.datafabric.hpe.com/62/ReferenceGuide/HBaseShellforMapR-DB.html
#cmd="\nprocesslist"
#cmd=$cmd"\nprocess list 'all'"
#cmd=$cmd"\nprocess list 'general'"
#cmd=$cmd"\nprocess list 'handler'"
#cmd=$cmd"\nprocess list 'rpc'"
#cmd=$cmd"\nprocess list 'operation'"
#cmd=$cmd"\nstatus"
#cmd=$cmd"\nstatus 'simple'"
#cmd=$cmd"\nstatus 'summary'"
#cmd=$cmd"\nstatus 'detailed'"
#cmd=$cmd"\nstatus 'replication'"
#cmd=$cmd"\nstatus 'replication','source'"
#cmd=$cmd"\nstatus 'replication','sink'"
cmd="\nwhoami"
cmd=$cmd"\nexit"
count=$((count+1))
xhbasecmd "$cmd"
verifyOutput "$cmd" "mapr (auth:CUSTOM)" $LINENO
verifyOutput "$cmd" "    groups: mapr, root" $LINENO

#cmd="create '$tp'"
#cmd=$cmd"\nexit"
#count=$((count+1))
#xhbasecmd "$cmd"
#xchkcmd "maprcli table create -path $tp" EXACT 0
#xchkcmd "maprcli table create -path $tp -directcopy false" EXACT 0
#xchkcmd "maprcli table replica autosetup -path $tp -replica $tp3 -directcopy false" EXACT 0
#cmd="alter '$tp', {NAME => 'cf1'}, {NAME => 'cf2'}, {NAME => 'nf1'}"
#cmd=$cmd"\nexit"
#count=$((count+1))
#xhbasecmd "$cmd"
#cmd=$cmd"\nput '$tp','r1','cf1:value','row1col1'"
#cmd=$cmd"\nput '$tp','r1','cf2:value','row1col2'"
#cmd=$cmd"\nput '$tp','r1','nf1:value','1'"
#cmd=$cmd"\nput '$tp','r2','cf1:value','row2col1'"
#cmd=$cmd"\nput '$tp','r2','cf2:value','row2col2'"
#cmd=$cmd"\nput '$tp','r2','nf1:value','2'"
#cmd=$cmd"\nexit"
#count=$((count+6))
#xhbasecmd "$cmd"
#sleep 30
#cmd="maprcli table replica list -path $tp -refreshnow true -json"
#xchkcmd "$cmd" IGNORE
#verifyOutput "$cmd" "jody" $LINENO
#cmd="\nscan '$tp'"
#cmd=$cmd"\nexit"
#xhbasecmd "$cmd"
#verifyOutput "$cmd" "jody" $LINENO
#cmd="\nscan '$tp3'"
#cmd=$cmd"\nexit"
#xhbasecmd "$cmd"
## note if this is working should get 2 rows, maybe 6 rows of output, comment out till working
#verifyOutput "$cmd" "jody" $LINENO
#xchkcmd "maprcli table replica remove -path $tp -replica $tp3" EXACT 0
#xchkcmd "maprcli table delete -path $tp" EXACT 0

# note copytable section has been commented out - multiple intermittent failure defects filed among others
#tableData $tp 2
# next command fails - defect filed
#xchkcmd "hbase com.mapr.fs.hbase.tools.mapreduce.CopyTable -src $tp -dst $tp3 -bulkload false" EXACT 0
#xchkcmd "hbase com.mapr.fs.hbase.tools.mapreduce.CopyTable -src $tp -dst $tp3 -mapreduce false -bulkload false" EXACT 2
#cmd="\nscan '$tp3'"
#cmd=$cmd"\nexit"
#xhbasecmd "$cmd"
#verifyOutput "$cmd" "row2col2" $LINENO
#xchkcmd "maprcli table delete -path $tp3" EXACT 0
 
#xchkcmd "hbase com.mapr.fs.hbase.tools.mapreduce.CopyTable -src $tp -dst $tp3 -mapreduce false -columns cf2 -maxversions 1 -starttime 0 -endtime 9423226300000 -bulkload false -numthreads 1" EXACT 2
#cmd="\nscan '$tp3'"
#cmd=$cmd"\nexit"
#xhbasecmd "$cmd"
#verifyOutput "$cmd" "row2col2" $LINENO
#xchkcmd "maprcli table delete -path $tp3" EXACT 0

#xchkcmd "hbase com.mapr.fs.hbase.tools.mapreduce.CopyTable -src $tp -dst $tp3 -mapreduce false -numthreads 9999 -bulkload false" EXACT 2
#cmd="\nscan '$tp3'"
#cmd=$cmd"\nexit"
#xhbasecmd "$cmd"
#verifyOutput "$cmd" "row2col2" $LINENO
#xchkcmd "maprcli table delete -path $tp3" EXACT 0
#xchkcmd "maprcli table delete -path $tp" EXACT 0
#tableData $tp 10
#xchkcmd "maprcli table delete -path $tp" EXACT 0

cmd="create '$tp', {NAME => 'cf1'}, {NAME => 'cf2'}, {NAME => 'nf1'}"
cmd=$cmd"\nexit"
xhbasecmd "$cmd"
xchkcmd "maprcli table replica autosetup -path $tp -replica $tp2 -multimaster true" EXACT 0
cmd="put '$tp','r1','cf1:value','row1col1'"
cmd=$cmd"\nput '$tp','r1','cf2:value','row1col2'"
cmd=$cmd"\nput '$tp','r1','nf1:value','1'"
cmd=$cmd"\nput '$tp','r2','cf1:value','row2col1'"
cmd=$cmd"\nput '$tp','r2','cf2:value','row2col2'"
cmd=$cmd"\nput '$tp','r2','nf1:value','2'"
cmd=$cmd"\nexit"
count=$((count+6))
xhbasecmd "$cmd"
cmd="put '$tp2','r3','cf1:value','row3col1'"
cmd=$cmd"\nput '$tp2','r3','cf2:value','row3col2'"
cmd=$cmd"\nput '$tp2','r3','nf1:value','3'"
cmd=$cmd"\nput '$tp2','r4','cf1:value','row4col1'"
cmd=$cmd"\nput '$tp2','r4','cf2:value','row4col2'"
cmd=$cmd"\nput '$tp2','r4','nf1:value','4'"
cmd=$cmd"\nexit"
count=$((count+6))
xhbasecmd "$cmd"
sleep 20
cmd="maprcli table replica list -path $tp -json"
xchkcmd "$cmd" EXACT 30
verifyOutput "$cmd" "copyTableCompletionPercentage\":100" $LINENO
cmd="\nscan '$tp'"
cmd=$cmd"\nexit"
xhbasecmd "$cmd"
verifyOutput "$cmd" "row4col2" $LINENO
cmd="\nscan '$tp2'"
cmd=$cmd"\nexit"
xhbasecmd "$cmd"
verifyOutput "$cmd" "row2col2" $LINENO
xchkcmd "maprcli table replica remove -path $tp -replica $tp2" EXACT 0
xchkcmd "maprcli table delete -path $tp" EXACT 0
xchkcmd "maprcli table delete -path $tp2" EXACT 0

cmd="create '/tmp/weblog', 'stats'"
# cmd=$cmd"\nlist" problem with listing home directory where permission doesn't allow
cmd=$cmd"\nput '/tmp/weblog', 'row1', 'stats:daily', 'test-daily-value'"
cmd=$cmd"\nput '/tmp/weblog', 'row1', 'stats:weekly', 'test-weekly-value'"
cmd=$cmd"\nput '/tmp/weblog', 'row2', 'stats:weekly', 'test-weekly-value'"
cmd=$cmd"\nscan '/tmp/weblog'"
cmd=$cmd"\nget '/tmp/weblog', 'row1'"
cmd=$cmd"\ndisable '/tmp/weblog'"
cmd=$cmd"\ndrop '/tmp/weblog'"
cmd=$cmd"\nexit"
count=$((count+7))
xhbasecmd "$cmd"
verifyOutput "$cmd" "column=stats:daily, timestamp=" $LINENO
verifyOutput "$cmd" "column=stats:weekly, timestamp=" $LINENO
verifyOutput "$cmd" ", value=test-daily-value" $LINENO
verifyOutput "$cmd" "COLUMN+CELL" $LINENO

maprcli table delete -path /tmp/a0 2>&1 >> /dev/null
cmd="create '/tmp/a0','f1', BULKLOAD => 'true'"
cmd=$cmd"\nexit"
xhbasecmd "$cmd"
maprcli table delete -path /tmp/a0 2>&1 >> /dev/null

cmd="create '$tp', 'cf1'\nscan '$tp'"
cmd=$cmd"\nexit"
xhbasecmd "$cmd"
maprcli table delete -path $tp 2>&1 >> /dev/null

cmd="create '$tp', 'cf1'\nput '$tp', 'r1', 'cf1:c1', 'v1'\nlist_perm '$tp'"
cmd=$cmd"\nset_perm '$tp','defaultreadperm','u:root|u:mapr'"
cmd=$cmd"\nset_perm '$tp',{COLUMN => 'cf1',PERM => 'compressionperm', EXPR =>'u:root|u:mapr'}"
cmd=$cmd"\nset_perm '$tp',{COLUMN => 'cf1:c1',PERM => 'writeperm', EXPR =>'u:root|u:mapr'}"
cmd=$cmd"\nlist_perm '$tp'"
cmd=$cmd"\nexit"
count=$((count+7))
xhbasecmd "$cmd"
verifyOutput "$cmd" "defaultreadperm               u:mapr" $LINENO
verifyOutput "$cmd" "cf1                compressionperm               u:mapr" $LINENO
verifyOutput "$cmd" "cf1                writeperm                     u:mapr" $LINENO
verifyOutput "$cmd" "defaultreadperm               u:root | u:mapr" $LINENO
verifyOutput "$cmd" "cf1                compressionperm               u:root | u:mapr" $LINENO
verifyOutput "$cmd" "cf1:c1             writeperm                     u:root | u:mapr" $LINENO
maprcli table delete -path $tp 2>&1 >> /dev/null

echo "create '/tmp/testtable', 'cf'" > $sn
echo "for i in '0'..'20' do" >> $sn
echo "put '/tmp/testtable', \"user-#{i}\", 'cf:user', \"user-#{i}\"" >> $sn
echo "put '/tmp/testtable', \"user-#{i}\", 'cf:email', \"email-#{i}\"" >> $sn
echo "put '/tmp/testtable', \"user-#{i}\", 'cf:name', \"name-#{i}\"" >> $sn
echo "put '/tmp/testtable', \"user-#{i}\", 'cf:password', \"password-#{i}\"" >> $sn
echo "end" >> $sn
echo "scan '/tmp/testtable'" >> $sn
echo "disable '/tmp/testtable'" >> $sn
echo "drop '/tmp/testtable'" >> $sn
echo "exit" >> $sn
cmd="/usr/bin/hbase shell $sn"
count=$((count+85))
xchkcmd "$cmd" IGNORE
verifyOutput "$cmd" ", value=password-20" $LINENO
rm -rf $sn

echo "create '/tmp/a0','f1', {SPLITS => ['10', '20', '30']}" > $sn
echo "disable '/tmp/a0'" >> $sn
echo "drop '/tmp/a0'" >> $sn
echo "create '/tmp/a0',{NAME=>'colfam', COMPRESSION=>'gz'}" >> $sn
echo "disable '/tmp/a0'" >> $sn
echo "drop '/tmp/a0'" >> $sn
echo "create '/tmp/a0',{NAME=>'colfam', COMPRESSION=>'lz4'}" >> $sn
echo "disable '/tmp/a0'" >> $sn
echo "drop '/tmp/a0'" >> $sn
echo "create '/tmp/a0',{NAME=>'colfam', COMPRESSION=>'snappy'}" >> $sn
echo "disable '/tmp/a0'" >> $sn
echo "drop '/tmp/a0'" >> $sn
echo "exit" >> $sn
count=$((count+13))
cmd="/usr/bin/hbase shell $sn"
xchkcmd "$cmd" IGNORE
rm -rf $sn


# see: https://docs.datafabric.hpe.com/62/MapR-DB/BulkLoadingandMapR-DBTables-binary.htm
cmd="create '/tmp/a0','f1', BULKLOAD => 'true'"
cmd=$cmd"\ndisable '/tmp/a0'"
cmd=$cmd"\ndrop '/tmp/a0'"
cmd=$cmd"\ncreate '/tmp/t1', 'f1', {SPLITS => ['10', '20', '30']}, {BULKLOAD => 'true'}"
cmd=$cmd"\ndisable '/tmp/t1'"
cmd=$cmd"\ndrop '/tmp/t1'"
cmd=$cmd"\nexit"
count=$((count+6))
xhbasecmd "$cmd" EXPECTED

cmd="create '/tmp/t1', 'cf1'"
cmd=$cmd"\nput '/tmp/t1', 'r1', 'cf1:c1', 'v1'"
cmd=$cmd"\nscan '/tmp/t1'"
count=$((count+2))
xhbasecmd "$cmd"
verifyOutput "$cmd" "column=cf1:c1, timestamp=" $LINENO
verifyOutput "$cmd" ", value=v1" $LINENO
xchkcmd "maprcli volume snapshot create -snapshotname tmpvolsnap -volume mapr.tmp" EXACT 0
cmd="maprcli volume snapshot list"
xchkcmd "$cmd" IGNORE
verifyOutput "$cmd" "tmpvolsnap" $LINENO
cmd="\nscan '/tmp/.snapshot/tmpvolsnap/t1'"
xhbasecmd "$cmd"
verifyOutput "$cmd" "column=cf1:c1, timestamp=" $LINENO
verifyOutput "$cmd" ", value=v1" $LINENO
xchkcmd "maprcli volume snapshot remove -snapshotname tmpvolsnap -volume mapr.tmp" EXACT 0
xchkcmd "maprcli table delete -path /tmp/t1" EXACT 0

cleanup
echo ""
echo "`date` $count command executions, including $dcount known defect executions and $ucount unexpected failures"
if [ $ucount -eq 0 ]
  then
  echo "PASS"
else
  echo "FAIL"
fi
rm -rf /tmp/scriptPID.lis
