#!/bin/bash
fileName="syslog.log"
while read a
do
  echo $a | grep -oP "^(\S+\s){5}\K[^\ ]+" | tr '\n' ','
  echo $a | grep -oP "^(\S+\s){6}\K[^\[\(]+" | tr '\n' ','
  echo $a | grep -oP '\(\K[^\)]+'
done
