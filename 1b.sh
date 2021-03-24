#!/bin/bash

grep -oP "^(\S+\s){6}\K[^\[\(]+" < syslog.log | sort | uniq -c | sort -r| while read a b; do echo "$b,$a";done
