#!/bin/bash
#Create by Rene Neumann from ZPE Systems
#last update on 2020-08-14
#
EXIST=$(grep -n "#### IPTABLES ####" /etc/syslog-ng/syslog-ng.conf | awk -F'[^0-9]*' '{print $1;}')
expr length "$EXIST"
if [ -z "$EXIST" ];
then
   echo "IPTABLES settings do not exist yet, lets create it..."
   #Created a backu of the syslog file
   echo "Lets create a backup of the original syslog config first"
   cp /etc/syslog-ng/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf.bck
   #Find Fail2Ban section
   FAIL2BAN=$(grep -n "### Fail2Ban ####" /etc/syslog-ng/syslog-ng.conf | sed 1d | awk -F'[^0-9]*' '{print $1;}')
   echo "Fail2Ban section ends in line $FAIL2BAN"
   IPSEC=$(($FAIL2BAN + 1))
   echo "Lets add the iptable section to line $IPSEC"
#   CMD=$(echo "sed '"$IPSEC"i#####\'")
#   echo "$CMD"
#   SEDCMD=$( echo "sed \'$IPSECi##### IPTABLES ####\nfilter f_iptables { message("IPTABLES-") and level(warning); };\ndestination d_iptables {\n        file("/var/log/iptables-dropped.log");\n                     };\nlog { source(src_dev_log); filter(f_iptables); destination(d_iptables); flags(final); };\n#### IPTABLES #####\n' /etc/syslog-ng/syslog-ng.conf.bck > /etc/syslog-ng/syslog-ng.conf")
#   echo $SEDCMD
   sed '54i##### IPTABLES ####\nfilter f_iptables { message("IPTABLES-") and level(warning); };\ndestination d_iptables {\n        file("/var/log/iptables-dropped.log");\n                     };\nlog { source(src_dev_log); filter(f_iptables); destination(d_iptables); flags(final); };\n#### IPTABLES #####\n' /etc/syslog-ng/syslog-ng.conf.bck > /etc/syslog-ng/syslog-ng.conf
   /etc/init.d/syslog restart
else
echo "IPTABLES settings do exist already, skip ...."
fi
