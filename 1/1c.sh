#!/bin/bash
uname=$(grep -oP "\(\K[^\)]+" syslog.log | sort | uniq | tr ' ' '\n')
err=0
inf=0

echo "$uname" | while read u
do
 echo "$u" | tr '\n' ','
 grep "($u)" syslog.log | grep -o " ERROR " | wc -w | tr '\n' ','
 grep "($u)" syslog.log | grep -o " INFO " | wc -w
done

#func(){
# while read -r a
# do
#  echo "$a" | grep -oP "\(\K[^\)]+" | tr '\n' ' '
#  echo "$a" | grep -oP "^(\S+\s){5}\K[^\ ]+"
# done
#}
#
#func < $1 | sort | uniq -c

#grep -oP "(\(\K[^\)]+)|(\:\ \K[^\ ]+)" syslog.log |\
#tr '\n' ' ' |\
#while read a b; do echo"$b $a\n"; done 
