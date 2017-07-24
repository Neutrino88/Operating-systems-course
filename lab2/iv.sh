#!/bin/bash

cd /bin

SHEBANGS=""
for FILE in * ;do
	if [[ -x "$FILE" ]] ;then
		TYPE=`file "/bin/$FILE"`
		SHEBANGS=$SHEBANGS+`echo "$TYPE" | sed -n '/shell/p'`
	fi
done

echo "$SHEBANGS" | tr -s '+' | tr -s '+' '\n' |
awk -F":" '{system("head -1 " $1)}' | 
sort | uniq -c | sort -n -r | head -1 |
awk -F"!" '{print $2}'