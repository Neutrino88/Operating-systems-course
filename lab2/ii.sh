#!/bin/bash

FILE="/var/log/Xorg.0.log"
FILE_BUFF="ScdD3hF5SDfssd344vr-@#r#4#)V34v39v.buff"

sed -n '/error/p' "$FILE" >full.log
sed '/error/d' "$FILE" >>full.log

sed 's/warn/Warning:/g' full.log >"$FILE_BUFF"
sed 's/info/Information:/g' "$FILE_BUFF" >full.log

rm "$FILE_BUFF"