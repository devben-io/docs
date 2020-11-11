# CJDNS - install on Debian 8


```
#Dependency
apt install nodejs build-essential git

cd /opt
git clone https://github.com/cjdelisle/cjdns.git
cd cjdns
./do
ln -s /opt/cjdns/cjdroute /usr/bin
umask 077 && ./cjdroute --genconf > /etc/cjdroute.conf
cp contrib/systemd/cjdns.service /etc/systemd/system/
systemctl enable cjdns
systemctl start cjdns
```
<!--more-->


