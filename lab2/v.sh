#!/bin/bash

cut -d ':' -f3,1 </etc/passwd | sort -n -t ':' -k 2
#awk -F":" '{print $3 " " $1}' </etc/passwd | sort -n