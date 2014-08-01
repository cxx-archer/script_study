# @description
#			simply create ssh user and samba user	
# @author	
#			xuxiacong
# @date
#			20140802
# @depends
#			only test in Ubunut 14.10
# @history
#
# who         when        why
# xuxiaocong  20140802    create this file
#

#! /bin/bash

username=root
home_base=/home
sel_shell=/bin/bash
smb_config=/etc/samba/smb.conf

if [ -n "$1" ]; then
	username=$1
else
	echo "Pls at least specify one user"
	exit -1
fi

echo "Add new user $uername"
useradd $username -s $sel_shell -m -d $home_base/$username
passwd $username

echo "Add new samba user $username"
smbpasswd -a $username
smbpasswd -e $username

echo "[$username]"                    >> $smb_config
echo "   comment = $username"         >> $smb_config
echo "   path = $home_base/$username" >> $smb_config
echo "   browseable = yes"            >> $smb_config
echo "   read only = no"              >> $smb_config
echo "   create mask = 0777"          >> $smb_config
echo "   directory mask = 0777"       >> $smb_config
echo "   valid users = $username"     >> $smb_config

service smbd restart
