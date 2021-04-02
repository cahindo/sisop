#!/bin/bash

fLog=syslog.log
uname=$(grep -oP "\(\K[^\)]+" ${fLog} | sort | uniq | tr ' ' '\n')

1a(){
    grep -oP "^(\S+\s){5}\K[^\ ]+" syslog.log       # jeenis log
    grep -oP "^(\S+\s){6}\K[^\[\(]+" syslog.log     # pesan log
    grep -oP "\(\K[^\)]+" syslog.log                # username
}

1b(){
    grep -i "ERROR" $fLog | grep -oP "^(\S+\s){6}\K[^\[\(]+" | sort | uniq -c | sort -nr | while read a b; do echo "$b,$a";done
}

1c(){
    echo "$uname" | while read u
    do
        echo "$u" | tr '\n' ','
        grep "($u)" $fLog | grep -o " INFO " | wc -w | tr '\n' ','
        grep "($u)" $fLog | grep -o " ERROR " | wc -w 
    done
}

1d(){
    echo "Error,Count" > error_message.csv
    1b >> error_message.csv
}

1e(){
    echo "Username,INFO,ERROR" > user_statistic.csv
    1c >> user_statistic.csv
}

1b
1c
1d
1e