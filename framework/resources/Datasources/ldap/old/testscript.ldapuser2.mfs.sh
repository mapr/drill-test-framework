set -x

/bin/rm output2.mfs.cat
sudo -u ldapuser2 ./ldapuser2.mfs.cat.sh > output2.mfs.cat 2>&1
diff ldapuser2.mfs.cat.output output2.mfs.cat

/bin/rm output2.mfs.cp
sudo -u ldapuser2 ./ldapuser2.mfs.cp.sh > output2.mfs.cp 2>&1
diff ldapuser2.mfs.cp.output output2.mfs.cp

/bin/rm output2.mfs.nox
sudo -u ldapuser2 ./ldapuser2.mfs.nox.sh > output2.mfs.nox 2>&1
diff ldapuser2.mfs.nox.output output2.mfs.nox

