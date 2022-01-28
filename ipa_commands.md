ipa host-find ipa  
* [web authentcation](https://www.freeipa.org/page/Web_App_Authentication/Example_setup)


## apache troubleshooting
created by me
vi /etc/httpd/conf.d/auth_ipa.conf
edited
vi /etc/httpd/conf/httpd.conf
apache conf
/etc/httpd/conf/httpd.conf 

## test apache config
apachectl configtest

## keberos authentication
yum -y install mod_ldap mod_authgssapi


## ldap
ldapsearch 
ldappasswd -Y GSSAPI -S -h ipaserver.freeipa.local uid=system,cn=sysaccounts,cn=etc,dc=test,dc=lan