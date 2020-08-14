# nodegrid-firewall
This contains samle firewall rules and chains which can be used toteher with the Nodegrid system. Firewall rules are desgined to be examples.
The Rules and Chains are designed to be used together. The basic idea is that all teh Chains are present on a system and through appropitae matching rules in INPUT and OUTPUT chains are the desired ports/functions allowed.
Multiple Chains are created which contain the most common rules for the function.

## Chains

### Nodegrid System Chains
- HTTPS
- SSH
- ICMP

### WAN Chain
Chain should be assigned to WAN interface. Rules utilise this chain should only exist in OUTPUT
- DNS
- NTP
- HTTPS
- ICMP

### MGMT Chains
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
- SMTP
- NFS
- FTP
- TFTP
- PXE
- KERBEROS
### IPSEC
### SSL-VPN
### TARGET-DEVICES
- RackPDU's (HTTP,HTTPS, SSH, SNMP)
- 3rd party Console Server
- Avocent DSR/MPU KVM Viewer
### Logging Chain
