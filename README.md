# nodegrid-firewall
This contains samle firewall rules and chains which can be used toteher with the Nodegrid system. Firewall rules are desgined to be examples.
The Rules and Chains are designed to be used together. The basic idea is that all teh Chains are present on a system and through appropitae matching rules in INPUT and OUTPUT chains are the desired ports/functions allowed.
Multiple Chains are created which contain the most common rules for the function.

## Chains

### Nodegrid System Chain
Chain should be assigned to INPUT and OUTPUT rules mataching Managment traffic. Chain allows the following connections to the Nodegrid
- HTTPS
- SSH
- ICMP

### WAN Chain
Chain should be assigned to any WAN interface. Rules utilise this chain should only exist in OUTPUT. Chain allows the following services.
- DNS
- NTP
- HTTPS
- ICMP

### MGMT Chain 
Chain should be assigned to OUTPUT rules mataching Managment traffic. Chain allows commaunication from the Nodegrid to the most common managment services
- SNMP
- DNS
- NTP
- ICMP
- SYSLOG
- HTTPS (Cloud Access)
- SSH/SCP/SFTP
- DHCP/ZTP
- LDAP/AD
- TACACS+
### MGMT-EXTRA 
Chain should be assigned to OUTPUT rules mataching Managment traffic. Chain allows commaunication from the Nodegrid to less common managment services
- SMTP
- NFS
- FTP
- TFTP
- PXE
- KERBEROS
### IPSEC
Chain should be assigned to INPUT AND OUTPUT rules matching IPSEC traffic. 
- IPSEC
### SSL-VPN
Chain should be assigned to INPUT AND OUTPUT rules matching SSL-VPN traffic.
- SSL-VPN
### TARGET-DEVICES
Chain should be only assigned to OUTPUT rules which match traffic going to target devices
- RackPDU's (HTTP,HTTPS, SSH, SNMP)
- 3rd party Console Server
- Avocent DSR/MPU KVM Viewer
### Logging Chain
Generic Chain which can be utilised anywhere and which will log all matching traffic to `/var/log/iptables-dropped.log`. Note that syslog configuration and logrotations needs to be configured. supporting scripts which will will perform the required settings exist.
- `iptables-syslog.sh` - setup of syslog
- `iptables-dropped-logrotate.sh` - setup of log rotation

- Logging of traffic
