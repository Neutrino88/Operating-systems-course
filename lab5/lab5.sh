#!/bin/bash
 
./lab5_clear.sh
# 1
awk -F: '{print "user " $1 " has id " $3}' </etc/passwd >work5.log
# 2
echo `chage -l root | head -1 | cut -d: -f2` >>work5.log
# 3
groups `cut -d: -f1 </etc/passwd` | # get strings in format "user : group1 ..."
cut -d: -f2 | # delete user
tr -s '[:space:]' '\n' | # separate groups which in one line
sort | uniq | # delete all repeated groups
tr -s '\n' ',' >>work5.log # all to one line
# 4
echo "Be careful!" > /etc/skel/readme.txt
# 6
groupadd g1
# 5 7 11
useradd -m -G g1 -s /usr/bin/me -p $(openssl passwd -crypt 12345678) u1
# 8
echo "
" `id u1 | cut -d ' ' -f1,3` >>work5.log
# 9
USER_GROUPS=`groups user | awk -F: '{print $2 ","}'`
usermod -G $USER_GROUPS'g1' user
# 10
grep '^g1:' /etc/group | cut -d ':' -f4 >>work5.log
# 12
useradd -p $(openssl passwd -crypt 87654321) u2
# 13
mkdir /home/test13
cp work5.log /home/test13/work5-1.log
cp work5.log /home/test13/work5-2.log
# 14
chown u1:u2 /home/test13
chown u1:u2 /home/test13/*
chmod 750 /home/test13
chmod 640 /home/test13/*
# 15
mkdir /home/test15
chmod +t /home/test15
chown u1:u1 /home/test15
# 16
cp /bin/nano /home/test15/nano
chown u1:u1 /home/test15/nano
chmod u+s /home/test15/nano