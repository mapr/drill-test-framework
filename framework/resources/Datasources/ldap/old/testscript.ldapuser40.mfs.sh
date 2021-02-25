set -x

/bin/rm output40.mfs.cat
sudo -u ldapuser40 ./ldapuser40.mfs.cat.sh > output40.mfs.cat 2>&1
diff ldapuser40.mfs.cat.output output40.mfs.cat

/bin/rm output40.mfs.cp
sudo -u ldapuser40 ./ldapuser40.mfs.cp.sh > output40.mfs.cp 2>&1
diff ldapuser40.mfs.cp.output output40.mfs.cp

/bin/rm output40.mfs.nox
sudo -u ldapuser40 ./ldapuser40.mfs.nox.sh > output40.mfs.nox 2>&1
diff ldapuser40.mfs.nox.output output40.mfs.nox

