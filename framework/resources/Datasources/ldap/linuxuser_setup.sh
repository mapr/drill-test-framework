

set -x

userdel -r linuxuser11
userdel -r linuxuser40
userdel -r linuxuser1
userdel -r linuxuser2

useradd -u 6101 linuxuser1
useradd -u 6102 linuxuser2
useradd -u 6111 linuxuser11
useradd -u 6140 linuxuser40

echo "linuxuser1:mapr" | sudo chpasswd
echo "linuxuser2:mapr" | sudo chpasswd
echo "linuxuser11:mapr" | sudo chpasswd
echo "linuxuser40:mapr" | sudo chpasswd

usermod -a -G linuxuser1,linuxuser2 linuxuser11
usermod -a -G linuxuser1 linuxuser40

