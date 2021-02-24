set -x

/bin/rm output2.cat
sudo -u ldapuser2 ./ldapuser2.cat.sh > output2.cat 2>&1
diff ldapuser2.cat.output output2.cat

/bin/rm output2.cp
sudo -u ldapuser2 ./ldapuser2.cp.sh > output2.cp 2>&1
diff ldapuser2.cp.output output2.cp

/bin/rm output2.nox
sudo -u ldapuser2 ./ldapuser2.nox.sh > output2.nox 2>&1
diff ldapuser2.nox.output output2.nox

