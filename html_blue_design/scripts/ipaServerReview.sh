# commands to review IPA settings

function ipAddress() {
   ifconfig ${1:-enp0s3} | awk '/inet / {print $2}';
}

function broadcast(){
   ifconfig ${1:-enp0s3} | awk '/broadcast/ {print $6}';
}

function netMask(){
   ifconfig ${1:-enp0s3} | awk '/netmask/ {print $4}'
}

function macAddress(){
   ifconfig ${1:-enp0s3} | awk '/ether / {print $2}'
}

function domainName(){
   echo $(hostname -d)
}

dns=$(ipAddress);

echo "  IP Address: $(ipAddress)";
echo "   Broadcast: $(broadcast)";
echo "Network Mask: $(netMask)";
echo "   localhost: $(hostname)";
echo "         DNS: $dns";
echo " MAC Address: $(macAddress)";
echo "      Domain: $(domainName)";

