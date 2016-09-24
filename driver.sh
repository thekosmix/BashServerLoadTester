#!/bin/bash 

#load config file
source config

#startTime in millis
scriptStartTime=`date +%s%N | cut -b1-13`
echo "=====>" starting testing at $scriptStartTime >> $logFile

#calculate sleeptime between consecutive hits
slpTime=`echo $totalTime/$loop | bc -l`

#create logFile
touch $logFile

#run loop for hitCount
x=1
while [ $x -le $loop ]
do
	bash url.sh $x &
	x=$(( $x + 1 ))
	sleep $slpTime
done

scriptEndTime=`date +%s%N | cut -b1-13`
scriptExecutionTime=$((scriptEndTime-scriptStartTime))

echo "=====>" total time in script execution = $scriptExecutionTime ms. >> $logFile

