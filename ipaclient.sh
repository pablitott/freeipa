yum update -y
yum install freeipa-client freeipa-admintools -y
yum install firewalld -y
systemctl start firewalld
systemctl enable firewalld


# for i in 80 88 389 464; do firewall-cmd --add-port=$i/tcp --zone=public --permanent; done
# for i in 464 123; do firewall-cmd --add-port=$i/udp --permanent --zone=public; done

# firewall-cmd --reload
ipa-getkeytab -s ipaserver.freeipa.local -p nfs/ipaclient01.freeipa.local@FREEIPA -k /tmp/krb5.keytab