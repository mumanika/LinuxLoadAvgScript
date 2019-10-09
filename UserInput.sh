#!/bin/bash

echo "Please enter the granularity in seconds for which the load average should be measured:"
read T
echo "Please enter the number of seconds you would like to run this report:"
read TP
echo "Please enter the HIGH CPU usage threshold:"
read X
echo "Please enter the VERY HIGH CPU usage threshold:"
read Y

mkdir /home/LoadAvgScript 2>/dev/null
PTH=$"/home/LoadAvgScript"
STR=$(cat $PTH/SpecFile.txt)

T=$(echo $STR | cut -d, -f1)
TP=$(echo $STR | cut -d, -f2)
X=$(echo $STR | cut -d, -f3)
Y=$(echo $STR | cut -d, -f4)

echo $T,$TP,$X,$Y
