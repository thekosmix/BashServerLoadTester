#!/bin/bash

#load config file
source config

requetId=$1

#startTime in millis
startTime=`date +%s%N | cut -b1-13`

if [ $method = "POST" ]; then
	curl -i $header $host$url --data $urlParam
else
	curl -i $header "$host$url?$urlParam"
fi

endTime=`date +%s%N | cut -b1-13`
totalTime=$((endTime-startTime))

echo requestId $requetId started at $startTime and ended in $totalTime ms. >> $logFile

