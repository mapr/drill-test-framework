


userdel -r ldapuser11
userdel -r ldapuser40
userdel -r ldapuser1
userdel -r ldapuser2

useradd -u 6001 ldapuser1
useradd -u 6002 ldapuser2
useradd -u 6011 ldapuser11
useradd -u 6040 ldapuser40

echo "ldapuser1:mapr" | sudo chpasswd
echo "ldapuser2:mapr" | sudo chpasswd
echo "ldapuser11:mapr" | sudo chpasswd
echo "ldapuser40:mapr" | sudo chpasswd

usermod -a -G ldapuser1,ldapuser2 ldapuser11
usermod -a -G ldapuser1 ldapuser40

