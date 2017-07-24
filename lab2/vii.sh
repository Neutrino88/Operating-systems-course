#!/bin/bash

man bash | 
tr -s '[:space:]' '\n' | 
sort | uniq -c | sort -n -r |
awk -F' ' '{if (length($2) >= 4) print $2}' | 
head -3