# Install IPA Client
## update hosts
**Add own IP address and hostname**
> 192.168.56.110 ipaclient01.freeipa.local ipaclient01

````bash
sudo yum install freeipa-client
````

## setup IPA client

sudo su 
ipa-client-install # setup
DNS discovery failed to determine your DNS domain  
Please provide the domain name of your IPA server (ex: example.com): **freeipa.local**  
DNS discovery failed to find the IPA Server  
Please provide your IPA server name (ex: ipa.example.com): **ipaserver.freeipa.local**  

The failure to use DNS to find your IPA server indicates that your resolv.conf file is not properly configured.
Autodiscovery of servers for failover cannot work with this configuration.
If you proceed with the installation, services will be configured to always access the discovered server for all operations and will not fail over to other servers in case of failure.
Proceed with fixed values and no DNS discovery? [no]:**yes**
Do you want to configure chrony with NTP server or pool address? [no]:**yes**
Enter NTP source server addresses separated by comma, or press Enter to skip: **~enter**
Enter a NTP source pool address, or press Enter to skip: **~Enter**

lient hostname: ipaclient02.freeipa.local
Realm: FREEIPA.LOCAL
DNS Domain: freeipa.local
IPA Server: ipaserver.freeipa.local
BaseDN: dc=freeipa,dc=local

Continue to configure the system with these values? [no]:yes
...
User authorized to enroll computers: admin
Password for admin@FREEIPA.LOCAL: # IPA admin password
...
Successfully retrieved CA cert
    Subject:     CN=Certificate Authority,O=FREEIPA.LOCAL
    Issuer:      CN=Certificate Authority,O=FREEIPA.LOCAL
    Valid From:  2022-01-19 14:54:54
    Valid Until: 2042-01-19 14:54:54

Enrolled in IPA realm FREEIPA.LOCAL  
Created /etc/ipa/default.conf  
Configured /etc/sssd/sssd.conf  
Configured /etc/krb5.conf for IPA realm FREEIPA.LOCAL  
Systemwide CA database updated.  
Hostname (ipaclient02.freeipa.local) does not have A/AAAA record.  
Failed to update DNS records.  
__Missing A/AAAA record(s) for host ipaclient02.freeipa.local: 192.168.56.120.__   
__Missing reverse record(s) for address(es): 192.168.56.120.__  
Adding SSH public key from /etc/ssh/ssh_host_ecdsa_key.pub  
Adding SSH public key from /etc/ssh/ssh_host_ed25519_key.pub  
Adding SSH public key from /etc/ssh/ssh_host_rsa_key.pub  
Could not update DNS SSHFP records.
SSSD enabled
Configured /etc/openldap/ldap.conf
Configured /etc/ssh/ssh_config
Configured /etc/ssh/sshd_config.d/04-ipa.conf
Configuring freeipa.local as NIS domain.
Client configuration complete.
The ipa-client-install command was successful


## Allow to create user home dir after in host
````bash
vi /etc/pam.d/system-auth
# add if you need ( create home directory automatically if it's none )
> session     optional      pam_mkhomedir.so skel=/etc/skel umask=077
````
## Enable SSSD
````bash
systemctl enable sssd
ln -s '/usr/lib/systemd/system/sssd.service' '/etc/systemd/system/multi-user.target.wants/sssd.service'
````
from ipaclient01 ssh ptrujillo onto ipaclient02



A dns records must be created for clients


client ;ogs
/var/log/ipaclient-install.log
