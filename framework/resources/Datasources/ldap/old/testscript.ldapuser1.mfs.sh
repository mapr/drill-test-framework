set -x

/bin/rm output1.mfs.cat
sudo -u ldapuser1 ./ldapuser1.mfs.cat.sh > output1.mfs.cat 2>&1
diff ldapuser1.mfs.cat.output output1.mfs.cat

/bin/rm output1.mfs.cp
sudo -u ldapuser1 ./ldapuser1.mfs.cp.sh > output1.mfs.cp 2>&1
diff ldapuser1.mfs.cp.output output1.mfs.cp

/bin/rm output1.mfs.nox
sudo -u ldapuser1 ./ldapuser1.mfs.nox.sh > output1.mfs.nox 2>&1
diff ldapuser1.mfs.nox.output output1.mfs.nox

