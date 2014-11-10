#!/bin/bash
#  Encoding: utf-8
#  Author:luol2@knownsec.com
#  Description:
#     此脚本用于实时监控节点中HTTP连接数
MONITOR_DIR="/root/monitor"
LAST_TIME=$(date +%s)

while true
do
	HTTP_CONN=$(netstat -ntp | grep ":80" | wc -l)
	DATE=$(date +%Y/%m/%d\ %H:%M:%S)
	DAY=$(date +%Y%m%d)
	HOUR=$(date +%Y%m%d%H)
	LOG_DIR="$MONITOR_DIR/$DAY"
	LOG_FILE="$MONITOR_DIR/$DAY/monitor-$HOUR.log"
	NOW_TIME=$(date +%s)
	if [ ! -d $LOG_DIR ]
	then
		mkdir -p $LOG_DIR
	fi

	if [ $NOW_TIME == $LAST_TIME ]
	then
		sleep 1
	else
		echo [$DATE]" - http connection numbers: "$HTTP_CONN >> $LOG_FILE
	fi
	LAST_TIME=$NOW_TIME
done
