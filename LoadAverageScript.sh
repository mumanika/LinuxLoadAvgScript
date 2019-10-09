#Shell script

#!/bin/bash

PTH=$"/home/LoadAvgScript"
STR=$(cat $PTH/SpecFile.txt)

T=$(echo $STR | cut -d, -f1)
TP=$(echo $STR | cut -d, -f2)
X=$(echo $STR | cut -d, -f3)
Y=$(echo $STR | cut -d, -f4)

mkdir /home/LoadAvgScript/Logs/ 2>/dev/null

TimeStamp=`date '+%Y_%m_%d__%H_%M_%S'`;
touch /home/LoadAvgScript/Logs/$TimeStamp.LoadAvg.csv
echo "Timestamp","1 min Load Avg","5 minute Load Avg","15 minute Load Avg" >> /home/LoadAvgScript/Logs/$TimeStamp.LoadAvg.csv

for ((i=1; i<=$TP; i++))
do

	A=$(top -d $T -b | grep -m1 -o -i "load average:.*\|load avg:.*" | cut -d: -f2 | tr -d '[:space:]')
	TimeStampTemp=$(date +"%I:%M:%S")
	printf $TimeStampTemp"," >> /home/LoadAvgScript/Logs/$TimeStamp.LoadAvg.csv
	printf $A >> /home/LoadAvgScript/Logs/$TimeStamp.LoadAvg.csv
	printf "\n" >> /home/LoadAvgScript/Logs/$TimeStamp.LoadAvg.csv
	sleep 1
 
done

tail -n +2 /home/LoadAvgScript/Logs/$TimeStamp.LoadAvg.csv >> /home/LoadAvgScript/Logs/LoadAvgTemp.csv

file=/home/LoadAvgScript/Logs/LoadAvgTemp.csv

IFS=,
while read -r time min1 min5 min15
do

	if [ $min1 > $X ]; then 
		echo $time,"High CPU Utilization",$min1 >> /home/LoadAvgScript/Logs/$TimeStamp.AlertLog.csv
	fi
	
	if [ $min5 > $Y ]; then
		echo $time,"VERY High CPU Utilization",$min5 >> /home/LoadAvgScript/Logs/$TimeStamp.AlertLog.csv
	fi
done < $file
rm -f /home/LoadAvgScript/Logs/LoadAvgTemp.csv
echo "This script has completed it's execution. Your reports can be found under /home/LoadAvgScript/Logs/"
#echo Done!
