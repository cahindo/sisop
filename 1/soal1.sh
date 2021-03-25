#!/bin/bash

fLog=syslog.log
uname=$(grep -oP "\(\K[^\)]+" ${fLog} | sort | uniq | tr ' ' '\n')

1b(){
    echo "Error,Count" > error_message.csv
    grep -i "ERROR" $fLog | grep -oP "^(\S+\s){6}\K[^\[\(]+" | sort | uniq -c | sort -nr | while read a b; do echo "$b,$a";done >> error_message.csv
}

1c(){
    echo "Username,INFO,ERROR" > user_statistic.csv
    echo "$uname" | while read u
    do
        echo "$u" | tr '\n' ','
        grep "($u)" $fLog | grep -o " INFO " | wc -w | tr '\n' ','
        grep "($u)" $fLog | grep -o " ERROR " | wc -w 
    done >> user_statistic.csv
}

1b
1c