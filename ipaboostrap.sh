yum update -yum -y
yum install freeipa-* -y
yum install bind bind-chroot -y
dnf install chrony -y

yum install firewalld -y
systemctl start firewalld
systemctl enable firewalld
