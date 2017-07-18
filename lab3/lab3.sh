#!/bin/bash

# 1
cd ~
mkdir test
# 2
cd ./test
for FILE in ~/* ;do
	if [[ -d "$FILE" ]] ;then
		echo "$FILE/" >> list
	else
		echo "$FILE" >> list
	fi
done

for FILE in ~/.* ;do
	if [[ -d "$FILE" && "$FILE" != "$HOME/." && "$FILE" != "$HOME/.." ]] ;then	
		echo "$FILE/" >> list
	else
		echo "$FILE" >> list
	fi
done
# 3
mkdir links
# 4
ln ./list ./links/list_link
# 5
rm  ~/test/list
# 6
cat ~/test/links/list_link
# 7
ln ./links/list_link ~/list1
# 8
find /etc -name "*.conf" 2>/dev/null >~/list_conf
# 9
find /etc -name "*.d" -type d -maxdepth 1 2>/dev/null >~/list_d
# 10
cat ~/list_conf ~/list_d > ~/list_conf_d
# 11
ln -s ~/list_conf_d ./links/list_conf_d_link
# 12
ln ~/list1 ./links/links_list1
# 13
more ./links/list_conf_d_link
# 14
mkdir ~/test/.sub
# 15
cp ~/list_conf_d ~/test/.sub
# 16
cp -b ~/list_conf_d ~/test/.sub 
# 17
mv ~/test/.sub/list_conf_d ~/test/.sub/list_etc
# 18
rm ~/list_conf_d
# 19
cat ./links/list_conf_d_link
# 20
cal 2012 > calendar.txt
# 21
head calendar.txt
# 22
find . | cat
# 23
echo "The number of hard links to list_link:"
ls -l ./links/ | awk '{if ($9 == "list_link") print $2 }'
# 24
man man > ~/man.txt
# 25
split -b 1000 ~/man.txt "man.txt_"
# 26
mkdir man.dir
# 27
mv man.txt_* man.dir
# 28
cat ./man.dir/man.txt_* >./man.dir/man.txt
rm ./man.dir/man.txt_*
# 29
diff ~/man.txt ./man.dir/man.txt && echo "OK"
# 30
echo "a few lines
at the
beginning" | cat - ~/man.txt > ~/man.txt'~'
echo "a few lines
at the
end" | cat ~/man.txt'~' - > ~/man.txt
rm ~/man.txt'~'
# 31
diff -u ~/man.txt ./man.dir/man.txt > ./man.dir/diff_file
# 32
mv ~/man.txt ./man.dir/man2.txt
# 33
patch ./man.dir/man2.txt ./man.dir/diff_file
# 34
diff -u ./man.dir/man.txt ./man.dir/man2.txt && echo "OK"
# 35 
read PAUSE
# 36
rm -rf ~/test
rm ~/list*
rm ~/file