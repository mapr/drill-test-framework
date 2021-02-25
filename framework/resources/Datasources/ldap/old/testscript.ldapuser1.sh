set -x

/bin/rm output1.cat
sudo -u ldapuser1 ./ldapuser1.cat.sh > output1.cat 2>&1
diff ldapuser1.cat.output output1.cat

/bin/rm output1.cp
sudo -u ldapuser1 ./ldapuser1.cp.sh > output1.cp 2>&1
diff ldapuser1.cp.output output1.cp

/bin/rm output1.nox
sudo -u ldapuser1 ./ldapuser1.nox.sh > output1.nox 2>&1
diff ldapuser1.nox.output output1.nox

