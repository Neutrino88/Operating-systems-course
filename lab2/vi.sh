#!/bin/bash

cd /var/log

let ALL_LINES=0
for FILE in * ;do
	if [[ "${FILE:${#LINE}-4:4}" == '.log' ]]  ;then
		FILE_LINES=`wc -l "$FILE" | cut -d ' ' -f1`
		let ALL_LINES=$ALL_LINES+$FILE_LINES
	fi
done

echo $ALL_LINES