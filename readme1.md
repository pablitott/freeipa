1. First of all, execute command: yum -y update
2. Set the name of the IPA Server: hostnamectl set-hostname ipa.centos.local
3. Edit /etc/hosts and add: 192.168.10.200 ipa.centos.local ipa
4. Download and install freeIPA packages with: yum install ipa-server bind-dyndb-ldap ipa-server-dns
5. Install and set freeIPA services: ipa-server-install --setup-dns
6. Follow the steps of previous item : here!
7. Next steps:  
    You must make sure these network ports are open TCP Ports:
    - 80, 443: HTTP/HTTPS
    - 389, 636: LDAP/LDAPS
    - 88, 464: kerberos
    - 53: bind
    - UDP Ports:
    - 88, 464: kerberos
    - 53: bind
    - 123: ntp
---
open firewall ports

````bash
# install firewalld
yum install firewalld
service start firewalld
service enable firewalld
for i in 80 443 389 636 88 464 ; do firewall-cmd --add-port=$i/tcp --permanent; done  
for i in 88 464 123; do firewall-cmd --add-port=$i/udp --permanent; done  
firewall-cmd --reload  
````
check open ports:
> sudo netstat -tulpn | grep LISTEN

### client open ports
````bash
for i in 80 443 80 389 636 88 464 53 ; do firewall-cmd --add-port=$i/tcp --zone=public --permanent; done
for i in 88 464 53 123; do firewall-cmd --add-port=$i/udp --permanent --zone=public; done
firewall-cmd --reload
````

To open ports using iptables
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
````bash
for i in 80 443 80 389 636 88 464 53 ; do iptables -A INPUT -p tcp --dport $i -j ACCEPT ; done
for i in 88 464 53 123; do iptables -A INPUT -p udp --dport $i -j ACCEPT ; done
````

create user home dir

mkdir -m0750 -p /home/ptrujillo
mkdir -m0750 -p /home/admin

chown XXXXXXXX:XXXXXXXX /home/ptrujillo/ 
where XXXXXXXX is the UID located in the freeipa dashboard Identity.Users guid

freeipa server
https://ipaserver.freeipa.local/

ipa-replica-install --principal admin --admin-password admin_password
ipa replica-prepare ipareplica01.freeipa.local --ip-address 192.168.56.102
