yum update -y
dnf install vim rsync -y
dnf install @freeipa-server oddjob-mkhomedir -y

ip="192.168.100.101"
fullhostname=$(hostname -f)
shorthost=$hostname -s)
echo "$ip $fullhostname $shorthost" >> /etc/hosts

yum install firewalld -y
systemctl start firewalld
systemctl enable firewalld


echo nameserver $ip >> /etc/resolv.conf
echo nameserver 8.8.8.8  >> /etc/resolv.conf
echo nameserver 8.8.4.4  >> /etc/resolv.conf

# after install ipa
for x in dns freeipa-ldap freeipa-ldaps freeipa-replication
do
    firewall-cmd --permanent --zone=public --add-service=${x}
done
firewall-cmd --reload